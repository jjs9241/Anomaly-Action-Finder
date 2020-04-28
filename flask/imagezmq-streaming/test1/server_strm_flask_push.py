from flask import Flask, render_template, request, redirect, url_for, jsonify, Response
from imutils.video import VideoStream
import cv2
import sys
import imagezmq
import imutils
import numpy as np
import threading

from pywebpush import webpush, WebPushException
import logging
import json, os

from flask_cors import CORS

app = Flask(__name__)
app.config['SECRET_KEY'] = '9OLWxND4o83j4K4iuopO'

CORS(app)

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

gCnt = 0

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
    global gCnt
    global global_token
    
    cnt=0
    print("sendImagesToWeb")
    # receiver = imagezmq.ImageHub(open_port='tcp://0.0.0.0:5566', REQ_REP = Flse)
    receiver = imagezmq.ImageHub()

    while True:
      print("while안")
      (camName, frame) = receiver.recv_image()
      print("camName: {},  gCnt: {}, cnt: {}".format(camName,gCnt,cnt))
      receiver.send_reply(b'OK')

      # jpg = cv2.imencode('.jpg', frame)[1]
      (flag, jpg) = cv2.imencode('.jpg', frame)
      cnt = cnt+1
      gCnt = gCnt+1
      if not flag:
          continue

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
    #서버 실행
  #  app.run(debug = True)
   app.run(host="0.0.0.0", port=5000)


