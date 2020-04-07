import cv2
import sys
import imagezmq
# from werkzeug.wrappers import Request, Response
# from werkzeug.serving import run_simple
from flask import Flask, render_template, request, redirect, url_for, jsonify, Response

app = Flask(__name__)

print(cv2.__version__)

def sendImagesToWeb():
    print("ddasds")
    # receiver = imagezmq.ImageHub(open_port='tcp://0.0.0.0:5566', REQ_REP = False)
    receiver = imagezmq.ImageHub()
    print("receiver : ",receiver)
    while True:
        print("while")
        camName, frame = receiver.recv_image()
        print("[INFO] receiving data from {}...".format(camName))
        jpg = cv2.imencode('.jpg', frame)[1]
        # yield b'--frame\r\nContent-Type:image/jpeg\r\n\r\n'+jpg.tostring()+b'\r\n'
        # yield b'--frame\r\nContent-Type:image/jpeg\r\n\r\n'+jpg+b'\r\n'
        yield (b'--frame\r\n'
               b'Content-Type: image/jpeg\r\n\r\n' + jpg.tobytes() + b'\r\n\r\n')
   
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
   app.run(debug = True)


