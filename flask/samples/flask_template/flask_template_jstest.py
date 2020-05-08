#지승이 비디오 보내기 및 받기 테스트 python
#여기는 로컬의 비디오 파일 보내기
#doUpload 호출하면 보냄
from flask import Flask, render_template, request
import requests
app = Flask(__name__)


@app.route("/")
def template_test():
    return render_template(
                'index.html',                      #렌더링 html 파일명
                title="Flask Template Test",       #title 텍스트 바인딩1
                my_str="Hello Flask!",             #my_str 텍스트 바인딩2
                my_list=[x + 1 for x in range(30)] #30개 리스트 선언(1~30)
            )


@app.route('/doUpload', methods=['GET'])
def doUpload():
    # UPLOAD_FOLDER = "D:\2019_multicampus\20. finale_project\ws\git\Anomaly-Action-Finder\flask\samples\flask_template\sample.mp4"
    # UPLOAD_FOLDER = "D:/2019_multicampus/20. finale_project/ws/git/Anomaly-Action-Finder/flask/samples/flask_template/sample.mp4"
    UPLOAD_FOLDER = "smaple.mp4"
    managerid = 'user0@testmail.com'
    category = 'Assault'
    params = {"managerid": {managerid}, "category": category}
    with open(UPLOAD_FOLDER, 'rb') as f:
        requests.post('http://70.12.224.24:5009/upload', data=params, files={'uploadedfile': f})
    return 'ok'

if __name__ == '__main__':
    app.run(debug=True)
