# 사용자가 로그인하면 jwt를 이용해 토큰 생성 및 DB 저장
# 이상행동이 검출된 영상과 사용자 정보가 전달되면 DB에 저장 
import os
from flask import Flask, request, jsonify, send_file
import json
import jwt

import dbModule
import tokenModule

from datetime import datetime

UPLOAD_FOLDER = "D:/final_test_video/"
ALLOWED_EXTENSIONS = set(['png', 'jpg', 'jpeg', 'git', 'mp4','avi'])

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello World!'

def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1] in ALLOWED_EXTENSIONS

@app.route('/upload', methods=['POST'])
def upload():
    if request.method == 'POST':
        #title = request.form['title']
        #writer = request.form['writer']
        #id = request.form['id']
        #content = request.form['content']
        #writeDate = request.form['writeDate']
        #imgName = request.form['imgName']

        auth = True
        #token = (request.json)['token']
        #tokenAuth = tokenModule.TokenAuth()
        #auth = tokenAuth.auth(token)

        if auth:
            file = request.files['uploadedfile']
            managerid = request.form['managerid']
            category = request.form['category']
            uploadFileName = file.filename

            path = UPLOAD_FOLDER + uploadFileName

            if file and allowed_file(file.filename):
                file.save(path)

                db_class = dbModule.Database()

                sql = "INSERT INTO finderdb_v0.video(PID, MongoDBID, ManagerID, Category,FilePath, FileName, Extension, Size, RegisterDay) \
                                                VALUES('%s', '%s', '%s', '%s', '%s', '%s', '%s', %d, '%s')" % (
                    managerid+file.filename, 'testMongoID', managerid, category,UPLOAD_FOLDER,uploadFileName,  'mp4', os.stat(path).st_size,
                    datetime.today())
                db_class.execute(sql)
                db_class.commit()

            return 'ok'

    return 'error'

@app.route('/image', methods=['GET'])
def loadImage():

    if request.method == 'GET':
        print('start token')
        #token = (request.json)['token']
        #video = (request.json)['video']
        #(request.json)['token'] = False
        auth = True

        token = request.args.get('token')[1:-1]
        video = request.args.get('video')
        print("token : ", token)
        print(type(token))
        tokenAuth = tokenModule.TokenAuth()
        auth = tokenAuth.auth(token)

        if auth:
            #print('fileName:' + fileName)
            return send_file(UPLOAD_FOLDER + video, mimetype='image')

    return 'error'

@app.route('/login', methods=['POST'])
def getToken():

    if request.method == 'POST':
        print('start token')
        token = (request.json)['token']
        print(token)
        print(type(token))
        (request.json)['token'] = False
        data_to_encode = {"some": "payload"}
        encryption_secret = "016D70400F07E9FC5F9A955B186119ED4F060EE9C9E22237897C6F49179275D1" #비밀키
        algorithm = "HS256"
        # encoded = jwt.encode(data_to_encode, encryption_secre, algorithm=algorithm)
        payload = jwt.decode(token, encryption_secret, algorithms=[algorithm])
        print(payload)
        db_class = dbModule.Database()

        sql = "INSERT INTO finderdb_v0.token(userid, createtime) \
                                            VALUES('%s', '%s')" % (
            payload['userId'], payload['createTime'])
        db_class.execute(sql)
        db_class.commit()

        return 'success'

    return 'error'

@app.route('/logout', methods=['POST'])
def deleteToken():

    if request.method == 'POST':
        print('start token')
        token = (request.json)['token']
        (request.json)['token'] = False
        data_to_encode = {"some": "payload"}
        encryption_secret = "016D70400F07E9FC5F9A955B186119ED4F060EE9C9E22237897C6F49179275D1" #비밀키
        algorithm = "HS256"
        # encoded = jwt.encode(data_to_encode, encryption_secre, algorithm=algorithm)
        payload = jwt.decode(token, encryption_secret, algorithms=[algorithm])
        print(payload)
        db_class = dbModule.Database()

        sql = "DELETE FROM finderdb_v0.token WHERE userid = '%s'" % (
            payload['userId'])
        db_class.execute(sql)
        db_class.commit()

        return 'success'

    return 'error'

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5009)

