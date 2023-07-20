from flask import Flask, request
import subprocess
# import json
app = Flask(__name__)

# ...
@app.route('/', methods=['POST'])
def process_json():
    if (request.headers.get('Authorization') == "Bearer 8801acb25f6ca38e5955540969770890"):
        if (request.headers.get('Content-Type') == 'application/json'):
            json = request.json

            tel_num = json['tel']
            flash = json['flash']
            msg = json['msg']

            print("Nummer: " + tel_num)
            print("Flash: " + flash)
            print("Nachricht: " + msg)

            tel_num = "-t " + tel_num
            flash = "-f " + flash
            msg = "-m " + "'" + msg + "'"

            filen = ("/home/sms/smssend/send_flash.sh" if flash == "true" else "/home/sms/smssend/send.sh")
            print(filen)
            # args = " -t " + tel_num + " -m " + "'" + msg + "'" + " -f " + flash
            # subprocess.call([filen + args])
            subprocess.call([filen, tel_num, msg, flash])
            return "OK"
        else:
            return 'Content-Type "' + request.headers.get('Content-Type') + '"not supported!'
    else:
        return "Unauthorized"

if __name__ == "__main__":
    app.run(host='0.0.0.0',port=80)