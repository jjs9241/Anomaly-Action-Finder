# USAGE
# python cctv_stream.py --server-ip SERVER_IP

#CCTV(라즈베리파이) 실행 파일 - 카메라 영상을 플라스크에 보내줌
# import the necessary packages
from imutils.video import VideoStream
import imagezmq
import argparse
import socket
import time

# construct the argument parser and parse the arguments
ap = argparse.ArgumentParser()
ap.add_argument("-s", "--server-ip", required=True,
	help="ip address of the server to which the client will connect")
ap.add_argument("-p", "--server-port", required=True,
	help="port number of the server to which the client will connect, default=5555")
args = vars(ap.parse_args())

# initialize the ImageSender object with the socket address of the
# server
if not args["server_port"]:
  print(args["server_port"])

sender = imagezmq.ImageSender(connect_to="tcp://{}:{}".format(
	args["server_ip"],args["server_port"]))

# get the host name, initialize the video stream, and allow the
# camera sensor to warmup
rpiName = socket.gethostname()
# vs = VideoStream(usePiCamera=True).start()
vs = VideoStream(usePiCamera=True, resolution=(640,480), framerate=24).start()
#vs = VideoStream(src=0).start()
time.sleep(2.0)
 
while True:
	# read the frame from the camera and send it to the server
	frame = vs.read()
  #print("s")
	sender.send_image(rpiName, frame)