from flask import Flask, render_template, Response
import cv2
import datetime
from flask_socketio import SocketIO, emit
import flask_socketio
import io
from camera import Camera as CAMERA
import base64
from PIL import Image
import numpy as np

class VideoCamera(object):
    def __init__(self, path):
        # Using OpenCV to capture from device 0. If you have trouble capturing
        # from a webcam, comment the line below out and use a video file
        # instead.
        self.video = cv2.VideoCapture(path)
        # If you decide to use video.mp4, you must have this file in the folder
        # as the main.py.
        # self.video = cv2.VideoCapture('video.mp4')

    def __del__(self):
        self.video.release()

    def get_frame(self):
        success, image = self.video.read()
        time_str = str(datetime.datetime.now())

        image = cv2.putText(image, time_str, (int(image.shape[1]/4), 50), cv2.FONT_HERSHEY_SIMPLEX, 2, (0, 0, 255), 3)
        # We are using Motion JPEG, but OpenCV defaults to capture raw images,
        # so we must encode it into JPEG in order to correctly display the
        # video stream.
        ret, jpeg = cv2.imencode('.jpg', image)
        return jpeg.tobytes()

app = Flask(__name__)
socketio = SocketIO(app)

@app.route('/')
def index():
    return render_template('index.html')

def gen(camera):
    while True:
        frame = camera.get_frame()
        yield (b'--frame\r\n'
               b'Content-Type: image/jpeg\r\n\r\n' + frame + b'\r\n\r\n')
def gen2(camera):
    while True:
        frame = camera.get_frame()
        yield (b'--frame\r\n'
               b'Content-Type: image/jpeg\r\n\r\n' + frame + b'\r\n\r\n')


@app.route('/video_feed')
def video_feed():
    return Response(gen2(CAMERA()),
                    mimetype='multipart/x-mixed-replace; boundary=frame')

@app.route('/video_feed2/<string:name>')
def video_feed2(name):
    def_name = name
    print(def_name)
    return Response(gen(VideoCamera("assets/video.mp4")),
                    mimetype='multipart/x-mixed-replace; boundary=frame')

@socketio.on('image')
def image(data_image):
    # print("data_image : ", data_image)
    # print("="*100)
    sbuf = io.StringIO()
    sbuf.write(data_image)

    # decode and convert into image
    b = io.BytesIO(base64.b64decode(data_image))
    # print("b is : ",b)
    pimg = Image.open(b).convert('RGB')

    #
    # # Process the image frame
    # frame = imutils.resize(frame, width=700)
    frame = cv2.flip(np.array(pimg), 1)
    imgencode = cv2.imencode('.jpg', frame)[1]
    #
    # # base64 encode
    stringData = base64.b64encode(imgencode).decode('utf-8')
    b64_src = 'data:image/jpg;base64,'
    stringData = b64_src + stringData
    #
    # # emit the frame back
    emit('response_back', stringData)

if __name__ == '__main__':
    socketio.run(app,host='0.0.0.0', debug=True)