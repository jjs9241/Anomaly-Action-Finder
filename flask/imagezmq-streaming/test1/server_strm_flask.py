#Flask 스트리밍, 분석, push 합친 것, 
#websocket만 합치면 됨
from flask import Flask, render_template, request, redirect, url_for, jsonify, Response
from imutils.video import VideoStream
import cv2
import sys
import imagezmq
import imutils
import numpy as np
import threading
import os
from two_stream_final_model import twostream_FinalModel
import argparse

#for push
from pywebpush import webpush, WebPushException
import logging
import json, os

from flask_cors import CORS


os.environ["CUDA_VISIBLE_DEVICES"]="0"
# from werkzeug.wrappers import Request, Response
# from werkzeug.serving import run_simple
sum_of_actions_number = 100
anormaly_action = [0, 2]
action_list = []
alarm_ratio = 0.9


Flag = False
app = Flask(__name__)
#push
app.config['SECRET_KEY'] = '9OLWxND4o83j4K4iuopO'


CORS(app)

#for push
DER_BASE64_ENCODED_PRIVATE_KEY_FILE_PATH = os.path.join(os.getcwd(),"private_key.txt")
DER_BASE64_ENCODED_PUBLIC_KEY_FILE_PATH = os.path.join(os.getcwd(),"public_key.txt")

VAPID_PRIVATE_KEY = open(DER_BASE64_ENCODED_PRIVATE_KEY_FILE_PATH, "r+").readline().strip("\n")
VAPID_PUBLIC_KEY = open(DER_BASE64_ENCODED_PUBLIC_KEY_FILE_PATH, "r+").read().strip("\n")

VAPID_CLAIMS = {
"sub": "mailto:develop@raturi.in"
}

#push를 위한 global token
global_token = None

#push 알림 함수
# subscription_information : global_token
# message_body : 보낼 메세지
def send_web_push(subscription_information, message_body):
    return webpush(
        subscription_info=subscription_information,
        data=message_body,
        vapid_private_key=VAPID_PRIVATE_KEY,
        vapid_claims=VAPID_CLAIMS
    )


@app.route('/')
def index():
    return render_template("index.html")

#push notification 구독 신청 및 토큰 저장
#get : 공개키 전달
#post : 생성된 토큰을 global_token에 저장
@app.route("/subscription/", methods=["GET", "POST"])
def subscription():
    """
        POST creates a subscription
        GET returns vapid public key which clients uses to send around push notification
    """
    print("subscription")
    global global_token
    if request.method == "GET":
        return Response(response=json.dumps({"public_key": VAPID_PUBLIC_KEY}),
            headers={"Access-Control-Allow-Origin": "*"}, content_type="application/json")

    subscription_token = request.get_json("subscription_token")
    global_token = json.loads(subscription_token["subscription_token"])
    # print("subscription global_token : ",global_token)
    # return Response(status=200, mimetype="application/json")
    return jsonify({'success':1})


def sendImagesToWeb():
    global global_token

    print("sendImagesToWeb")
    # receiver = imagezmq.ImageHub(open_port='tcp://0.0.0.0:5566', REQ_REP = Flse)
    receiver = imagezmq.ImageHub()

    while True:
        (camName, frame) = receiver.recv_image()
        receiver.send_reply(b'OK')
        # print("[INFO] receiving data from {}...".format(camName))
        # jpg = cv2.imencode('.jpg', frame)[1]
        # print(frame.shape)
        # jpg = cv2.resize()
        # cv2.imwrite("XXX.jpg", frame)

        # jpg = frame
        # # recognition using deep learning
        jpg, alarm = model.predict(frame)
        if alarm is True:
          # send alarm
          send_web_push(global_token, "이상행동 발생!")


        # print("predict : ", action)
        (flag, jpg) = cv2.imencode('.jpg', jpg)
        
        if not flag:
            continue
        # yield b'--frame\r\nContent-Type:image/jpeg\r\n\r\n'+jpg.tostring()+b'\r\n'
        # yield b'--frame\r\nContent-Type:image/jpeg\r\n\r\n'+jpg+b'\r\n'
        yield(b'--frame\r\n' b'Content-Type: image/jpeg\r\n\r\n' + bytearray(jpg) + b'\r\n')
   
@app.route('/video_feed')
def video_feed():
    print("video")
    return Response(sendImagesToWeb(),
                    mimetype='multipart/x-mixed-replace; boundary=frame')

# if __name__ == '__main__':
#     print("sdfa")
#     run_simple('127.0.0.1', 4000, application)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="default usage : python server_strm_flask.py --rgb_model Final_weights/weights_i3d_RGB_no_softmax.hdf5")
    parser.add_argument('--rgb_model', required=True, help="RGB model weights")
    parser.add_argument('--opt_model', default=None, required=False, help="opt_model weights")
    args = parser.parse_args()

    #서버 실행
    if Flag is False:
        model = twostream_FinalModel(args.rgb_model, args.opt_model)
        Flag = True
    app.run(host="0.0.0.0", debug = True, use_reloader=False)


