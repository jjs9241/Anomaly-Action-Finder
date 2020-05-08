from flask import Flask, render_template, request, redirect, url_for, jsonify, Response
from imutils.video import VideoStream
import cv2
import sys
import imagezmq
import imutils
import numpy as np
import threading
import time
import datetime


#outputFrame으로 라즈베리파이에서 받음
outputFrame = None
lock = threading.Lock()



# flask object 초기화
app = Flask(__name__)



@app.route('/')
def index():
    return render_template("index.html")

gCnt = 0
gCancleNum = 0
gCancleFlag = False
def recvImagesFromCCTV():
  print("recvImagesFromCCTV")
  global outputFrame, lock, gCnt, gCancleNum

  # time.sleep(2.0)
  receiver = imagezmq.ImageHub()

  # nameFlag = False
  # print("recvImagesFromCCTV 2")

  cnt=0
  camName = "pi host"
  nameFlag = True
  while True:
    with lock:
      print("FromCCTV camName: {}, nf: {}, gCnt: {}, cnt: {}".format(camName,nameFlag,gCnt,cnt))
      cnt = cnt+1
      gCnt = gCnt+1

      if gCancleFlag:
        gCancleNum = gCancleNum +1
        if gCancleNum > 10:
          break      
    
  # print("while문")
  # print("befor recv")
  # (camName, frame) = receiver.recv_image()
  # # print("after recv")
  # receiver.send_reply(b'OK')
  # # print("in lock")
  # outputFrame = frame.copy()


def sendImagesToWeb2():
    print("sendImagesToWeb")
    # receiver = imagezmq.ImageHub(open_port='tcp://0.0.0.0:5566', REQ_REP = False)
    global outputFrame, lock, gCancleNum, gCnt
    # receiver = imagezmq.ImageHub()
    cnt=0
    gCancleNum = True
    while True:
      with lock:
        print("sendToWeb cnt : {}, gcnt :{}".format(cnt,gCnt))
        cnt=cnt+1
        gCnt = gCnt+1



def sendImagesToWeb():
    print("sendImagesToWeb")
    # receiver = imagezmq.ImageHub(open_port='tcp://0.0.0.0:5566', REQ_REP = False)
    global outputFrame, lock
    # receiver = imagezmq.ImageHub()

    while True:
      # if outputFrame is None:
      #     continue
      with lock:
        # print("sendImagesToWeb lock문")
        # if outputFrame is None:
        #   continue
        # print("sendImagesToWeb outputFrame")
        # (camName, frame) = receiver.recv_image()
        # receiver.send_reply(b'OK')

        # jpg = cv2.imencode('.jpg', frame)[1]
        (flag, encodedImage) = cv2.imencode('.jpg', outputFrame)

        if not flag:
            continue
        
        # print("before yield")
        yield(b'--frame\r\n' b'Content-Type: image/jpeg\r\n\r\n' + bytearray(encodedImage) + b'\r\n')
        outputFrame = None
        # print("after yield")
   
@app.route('/video_feed')
def video_feed():
    print("video")
    return Response(sendImagesToWeb2(),
                    mimetype='multipart/x-mixed-replace; boundary=frame')

# if __name__ == '__main__':
#     print("sdfa")
#     run_simple('127.0.0.1', 4000, application)

if __name__ == '__main__':
  # start a thread that will perform motion detection
	
  # t = threading.Thread(target=recvImagesFromCCTV)
  t = threading.Thread(target=recvImagesFromCCTV)
  # t = threading.Thread(target=recvImagesFromCCTV2)
  t.daemon = True
  t.start()
  
  #Flask app 실행
  app.run(host="0.0.0.0", debug = True, threaded=True, use_reloader=False)
  # app.run(host="0.0.0.0", debug = True, threaded=True)
  


