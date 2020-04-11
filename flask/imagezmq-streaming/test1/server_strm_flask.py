from flask import Flask, render_template, request, redirect, url_for, jsonify, Response
from imutils.video import VideoStream
import cv2
import sys
import imagezmq
import imutils
import numpy as np
import threading
from final_model import FinalModel

# from werkzeug.wrappers import Request, Response
# from werkzeug.serving import run_simple

Flag = False
app = Flask(__name__)

# print(cv2.__version__)

@app.route('/')
def index():
    return render_template("index.html")

def sendImagesToWeb():
    print("sendImagesToWeb")
    # receiver = imagezmq.ImageHub(open_port='tcp://0.0.0.0:5566', REQ_REP = False)
    receiver = imagezmq.ImageHub()
    #print("receiver : ",receiver)
    while True:
        (camName, frame) = receiver.recv_image()
        receiver.send_reply(b'OK')
        # print("[INFO] receiving data from {}...".format(camName))
        # jpg = cv2.imencode('.jpg', frame)[1]
        print(frame.shape)
        # jpg = cv2.resize()
        cv2.imwrite("XXX.jpg", frame)
        jpg = model.predict(frame)
        (flag, jpg) = cv2.imencode('.jpg', jpg)
        print("predict")
        if not flag:
            continue
        # yield b'--frame\r\nContent-Type:image/jpeg\r\n\r\n'+jpg.tostring()+b'\r\n'
        # yield b'--frame\r\nContent-Type:image/jpeg\r\n\r\n'+jpg+b'\r\n'
        yield(b'--frame\r\n' b'Content-Type: image/jpeg\r\n\r\n' + bytearray(jpg) + b'\r\n')
   
# @Request.application
# def application(request):
#     print("어플 실행")
#     return Response(sendImagesToWeb(), mimetype='multipart/x-mixed-replace; boundary=frame')

# if __name__ == '__main__':
#     print("sdfa")
#     run_simple('127.0.0.1', 4000, application)

@app.route('/video_feed')
def video_feed():
    print("video")
    return Response(sendImagesToWeb(),
                    mimetype='multipart/x-mixed-replace; boundary=frame')

if __name__ == '__main__':
    #서버 실행
    if Flag is False:
        model = FinalModel("i3d_RGB.hdf5")
        Flag = True
    app.run(host="0.0.0.0",debug = True, use_reloader=False)


