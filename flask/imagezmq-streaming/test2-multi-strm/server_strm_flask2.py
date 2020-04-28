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

def recvImagesFromCCTV():
  print("recvImagesFromCCTV")
  global outputFrame, lock, gCnt

  # time.sleep(2.0)
  receiver = imagezmq.ImageHub()

  nameFlag = False
  # print("recvImagesFromCCTV 2")

  cnt=0

  while True:
    # print("while문")
    # print("befor recv")
    with lock:
      (camName, frame) = receiver.recv_image()
      # print("after recv")
      receiver.send_reply(b'OK')
      # print("after reply camName: {}, nf: {}, gCnt: {}, cnt: {}".format(camName,nameFlag,gCnt,cnt))
      # if camName and not nameFlag:
      #   print("camName : ",camName)
      #   nameFlag = True
      # jpg = cv2.imencode('.jpg', frame)[1]
      # (flag, jpg) = cv2.imencode('.jpg', frame)

      # grab the current timestamp and draw it on the frame
      # timestamp = datetime.datetime.now()
      # cv2.putText(frame, timestamp.strftime(
      #   "%A %d %B %Y %I:%M:%S%p"), (10, frame.shape[0] - 10),
      #   cv2.FONT_HERSHEY_SIMPLEX, 0.35, (0, 0, 255), 1)
      cnt = cnt+1
      gCnt = gCnt+1
      # print("in lock")
      outputFrame = frame.copy()

def recvImagesFromCCTV2():
  print("recvImagesFromCCTV")
  global outputFrame, lock, gCnt

  # time.sleep(2.0)
  receiver = imagezmq.ImageHub()

  nameFlag = False
  # print("recvImagesFromCCTV 2")

  cnt=0

  # while True:
  # print("while문")
  # print("befor recv")
  with lock:
    (camName, frame) = receiver.recv_image()
    # print("after recv")
    receiver.send_reply(b'OK')
    # print("after reply camName: {}, nf: {}, gCnt: {}, cnt: {}".format(camName,nameFlag,gCnt,cnt))
    # if camName and not nameFlag:
    #   print("camName : ",camName)
    #   nameFlag = True
    # jpg = cv2.imencode('.jpg', frame)[1]
    # (flag, jpg) = cv2.imencode('.jpg', frame)

    # grab the current timestamp and draw it on the frame
    # timestamp = datetime.datetime.now()
    # cv2.putText(frame, timestamp.strftime(
    #   "%A %d %B %Y %I:%M:%S%p"), (10, frame.shape[0] - 10),
    #   cv2.FONT_HERSHEY_SIMPLEX, 0.35, (0, 0, 255), 1)
    cnt = cnt+1
    gCnt = gCnt+1
    # print("in lock")
    outputFrame = frame.copy()



def sendImagesToWeb():
    print("sendImagesToWeb")
    # receiver = imagezmq.ImageHub(open_port='tcp://0.0.0.0:5566', REQ_REP = False)
    global outputFrame, lock
    # receiver = imagezmq.ImageHub()

    while True:
      if outputFrame:
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

def sendImagesToWeb2():
    print("sendImagesToWeb")
    # receiver = imagezmq.ImageHub(open_port='tcp://0.0.0.0:5566', REQ_REP = False)
    global outputFrame, lock
    # receiver = imagezmq.ImageHub()

    while True:
      if outputFrame is None:
          continue
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
    return Response(sendImagesToWeb(),
                    mimetype='multipart/x-mixed-replace; boundary=frame')

# if __name__ == '__main__':
#     print("sdfa")
#     run_simple('127.0.0.1', 4000, application)

if __name__ == '__main__':
  # start a thread that will perform motion detection
	
  # t = threading.Thread(target=recvImagesFromCCTV)
  # t = threading.Thread(target=recvImagesFromCCTV)
  t = threading.Thread(target=recvImagesFromCCTV2)
  t.daemon = True
  t.start()
  
  #Flask app 실행
  app.run(host="0.0.0.0", debug = True, threaded=True, use_reloader=False)
  # app.run(host="0.0.0.0", debug = True, threaded=True)
  


