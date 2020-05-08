#Flask와 스트리밍 테스트용
from flask import Flask, render_template, request, redirect, url_for, jsonify, Response
from imutils.video import VideoStream
import cv2
import sys
import imagezmq
import imutils
import numpy as np
import threading

app = Flask(__name__)

gCnt = 0

@app.route('/')
def index():
    return render_template("index.html")

def sendImagesToWeb():
    global gCnt
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
   app.run(host="0.0.0.0")


