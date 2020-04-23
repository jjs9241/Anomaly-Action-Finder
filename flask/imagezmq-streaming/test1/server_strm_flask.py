from flask import Flask, render_template, request, redirect, url_for, jsonify, Response
from imutils.video import VideoStream
import cv2
import sys
import imagezmq
import imutils
import numpy as np
import threading
from final_model import FinalModel
import os
from two_stream_final_model import twostream_FinalModel
import argparse

os.environ["CUDA_VISIBLE_DEVICES"]="1"
# from werkzeug.wrappers import Request, Response
# from werkzeug.serving import run_simple
sum_of_actions_number = 100
anormaly_action = [0, 2]
action_list = []
alarm_ratio = 0.9


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

        # recognition using deep learning
        jpg, action = model.predict(frame)
        # add action into action_list
        if len(action_list) != sum_of_actions_number:
            result_action = 1 if action in anormaly_action else 0
            action_list += [result_action]
        else:
            result_action = 1 if action in anormaly_action else 0
            action_list = action_list[1:] + [result_action]

        #calculate action
        if len(action_list) == sum_of_actions_number:
            if (sum(action_list) / sum_of_actions_number) > alarm_ratio:
                #Send Alarm Message
                pass 

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
    parser = argparse.ArgumentParser(description="default usage : python server_strm_flask.py --rgb_model Final_weights/weights_i3d_RGB_no_softmax.hdf5")
    parser.add_argument('--rgb_model', required=True, help="RGB model weights")
    parser.add_argument('--opt_model', default=None, required=False, help="opt_model weights")
    args = parser.parse_args()

    #서버 실행
    if Flag is False:
        # model = FinalModel("weights_i3d_RGB_v3.hdf5")
        model = twostream_FinalModel(args.rgb_model, args.opt_model)
        Flag = True
    app.run(host="0.0.0.0",debug = True, use_reloader=False)


