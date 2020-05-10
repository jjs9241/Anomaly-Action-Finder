import jwt
import dbModule

class TokenAuth():
    def __init__(self):
        pass

    def auth(self, token):
        print(token)
        data_to_encode = {"some": "payload"}
        encryption_secret = "016D70400F07E9FC5F9A955B186119ED4F060EE9C9E22237897C6F49179275D1"  # 비밀키
        algorithm = "HS256"
        payload = jwt.decode(token, encryption_secret, algorithms=[algorithm])
        print(payload)
        db_class = dbModule.Database()

        sql = "SELECT userid,createtime FROM finderdb_v0.token WHERE userid = '%s'" % (
            payload['userId'])
        row = db_class.executeAll(sql)

        print(row)
        #print(payload['createTime'])

        if row[0]['userid'] == payload['userId']:
            if row[0]['createtime'].strftime('%Y-%m-%d %H:%M:%S') == payload['createTime']:
                return True
        return False
