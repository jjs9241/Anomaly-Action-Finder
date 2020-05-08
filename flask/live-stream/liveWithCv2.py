# Web streaming example
# Source code from the official PiCamera package
# http://picamera.readthedocs.io/en/latest/recipes2.html#web-streaming

import io
import picamera
import logging
import socketserver
from threading import Condition
from http import server

from picamera.array import PiRGBArray
from picamera import PiCamera
import time
import cv2

import threading

import socket, struct, pickle, zlib
import numpy

PAGE="""\
<html>
<head>
<title>Raspberry Pi - Surveillance Camera</title>
</head>
<body>
<center><h1>Raspberry Pi - Surveillance Camera</h1></center>
<center><img src="stream.mjpg" width="640" height="480"></center>
</body>
</html>
"""

# send_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
# send_socket.connect(('192.168.35.109',5001))
# connection = send_socket.makefile('wb')

img_counter = 0

class StreamingOutput(object):
    def __init__(self):
        self.frame = None
        self.buffer = io.BytesIO()
        self.condition = Condition()

    def write(self, buf):
        if buf.startswith(b'\xff\xd8'):
            # New frame, copy the existing buffer's content and notify all
            # clients it's available
            self.buffer.truncate()
            with self.condition:
                self.frame = self.buffer.getvalue()
                self.condition.notify_all()
            self.buffer.seek(0)
        return self.buffer.write(buf)

class StreamingHandler(server.BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/':
            self.send_response(301)
            self.send_header('Location', '/index.html')
            self.end_headers()
        elif self.path == '/index.html':
            content = PAGE.encode('utf-8')
            self.send_response(200)
            self.send_header('Content-Type', 'text/html')
            self.send_header('Content-Length', len(content))
            self.end_headers()
            self.wfile.write(content)
        elif self.path == '/stream.mjpg':
            self.send_response(200)
            self.send_header('Age', 0)
            self.send_header('Cache-Control', 'no-cache, private')
            self.send_header('Pragma', 'no-cache')
            self.send_header('Content-Type', 'multipart/x-mixed-replace; boundary=FRAME')
            self.end_headers()
            try:
                while True:
                    with output.condition:
                        output.condition.wait()
                        frame = output.frame
                    self.wfile.write(b'--FRAME\r\n')
                    self.send_header('Content-Type', 'image/jpeg')
                    self.send_header('Content-Length', len(frame))
                    self.end_headers()
                    self.wfile.write(frame)
                    self.wfile.write(b'\r\n')
            except Exception as e:
                logging.warning(
                    'Removed streaming client %s: %s',
                    self.client_address, str(e))
        elif self.path == '/cv2':
          capture = cv2.VideoCapture(0)
          ret, frame = capture.read()
          encode_param=[int(cv2.IMWRITE_JPEG_QUALITY),90]
          result, imgencode = cv2.imencode('.jpg', frame, encode_param)
          data = numpy.array(imgencode)
          stringData = data.tostring()
          self.send_response(200)
          self.send_header('Content-Type', 'image/jpeg')
          self.send_header('Content-Length', len(stringData))
          self.end_headers()
          self.wfile.write(stringData)
        else:
            self.send_error(404)
            self.end_headers()



class StreamingServer(socketserver.ThreadingMixIn, server.HTTPServer):
    allow_reuse_address = True
    daemon_threads = True

with picamera.PiCamera(resolution='640x480', framerate=16) as camera:
    output = StreamingOutput()
    #Uncomment the next line to change your Pi's Camera rotation (in degrees)
    #camera.rotation = 90
    camera.start_recording(output, format='mjpeg')
    try:
        address = ('', 8000)
        server = StreamingServer(address, StreamingHandler)
        server.serve_forever()
    finally:
        camera.stop_recording()


# def save_img_thread():
#   print("=========  save image =======")
#   #pi array to cv2 
#   # rawCapture = PiRGBArray(camera)
#   # camera.capture(rawCapture, format="bgr")
#   # image = rawCapture.array
#   #cv2.imwrite('/home/pi/workspace/image/imagecv2.jpg',image)

#   capture = cv2.VideoCapture(0)
#   ret, frame = capture.read()

#   encode_param=[int(cv2.IMWRITE_JPEG_QUALITY),90]
#   result, imgencode = cv2.imencode('.jpg', frame, encode_param)
#   data = numpy.array(imgencode)
#   stringData = data.tostring()

#   sock.send( str(len(stringData)).ljust(16));
#   sock.send( stringData );
#   threading.Timer(1, save_img_thread).start()

# save_img_thread()




