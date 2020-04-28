import logging
import json, os

from flask import request, Response, render_template, jsonify, Flask
from pywebpush import webpush, WebPushException

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

global_token = None

def send_web_push(subscription_information, message_body):
    return webpush(
        subscription_info=subscription_information,
        data=message_body,
        vapid_private_key=VAPID_PRIVATE_KEY,
        vapid_claims=VAPID_CLAIMS
    )

@app.route('/')
def index():
    return render_template('index.html')

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
    print("subscription_token : ",subscription_token)
    print("subscription_token : ",type(subscription_token))
    # print("subscription_token : ",subscription_token.get_json("subscription_token"))
    global_token = subscription_token["subscription_token"]
    print("global_token : ",global_token)
    print("global_token type : ",type(global_token))
    print("global_token json load : ",json.loads(global_token))
    print("global_token type : ",type(json.loads(global_token)))
    global_token = json.loads(global_token)
    # print("subscription_token : ",global_token["subscription_token"])
    return Response(status=200, mimetype="application/json")

@app.route("/push_v1/",methods=['GET','POST'])
def push_v1():
    global global_token
    message = "등록됨"
    print("is_json",request.is_json)

    if not request.json or not request.json.get('sub_token'):
        return jsonify({'failed':1})

    

    token = request.json.get('sub_token')
    try:
        token = json.loads(token)
        print("token : ",token)
        print("token type : ",type(token))
        print("global_token",global_token)
        print("global_token type",type(global_token))
        # global_token = token
        send_web_push(global_token, message)
        return jsonify({'success':1})
    except Exception as e:
        print("error",e)
        return jsonify({'failed':str(e)})

@app.route("/push",methods=['GET','POST'])
def pushToServer():
  global global_token

  print("pushToServer global token : ",global_token)

  send_web_push(global_token, "push에서 보냄")
  return jsonify({'success':1})

if __name__ == "__main__":
    app.run(host="0.0.0.0",port=5000)
