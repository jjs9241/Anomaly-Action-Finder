# -*- coding: utf8 -*-
import multiprocessing
# import pandas as pd
# from pandas.tseries.offsets import Hour, Minute, Second
import json

from traceback import format_exc

# from pymongo import MongoClient
# client = MongoClient('localhost', 27017)
# db = client['seismic']

timecheck = ""
result = []


from flask import Flask, render_template
from flask_socketio import SocketIO, emit

app = Flask(__name__)
app.config['SECRET_KEY'] = 'secret!'
socketio = SocketIO(app)

@app.route('/')
def index():
    return render_template('data.html')


class IO_Socket(multiprocessing.Process):

    """client connection generator"""

    def __init__(self):

        """
        constructor for multiprocessing

        """

        multiprocessing.Process.__init__(self)
        self.__suspend = False
        self.__exit = False


    def run(self):

        """Process start method"""

        # wrap Flask application with socketio's middleware
        global app

        socketio.run(app, host='0.0.0.0', port=5555)

    def mySuspend(self):
        self.__suspend = True

    def myResume(self):
        self.__suspend = False

    def myExit(self):
        self.__exit = True

#방송하기
def some_function():
    socketio.emit('some event', {'data': 42})


@socketio.on('real_time')
def send_data(message):

    from datetime import datetime
    global timecheck
    global result


    try:
        now = str(datetime.utcnow().replace(microsecond=0) + Hour(9) - Second(5))
        if timecheck == now:
            emit('fromserver', json.dumps({'data': result['data']}))

        else:
            get = {"time": now}
            result = db["buffer"].find_one(get)

            emit('fromserver', json.dumps({'data': result['data']}))
            timecheck = now

    # exception handling
    except:
        # db.close()
        print("occur exeption" + format_exc())
        # pass
    # else:
    #     print('off mode')
    #     pass
    # else:
    #     send_by_time(message)