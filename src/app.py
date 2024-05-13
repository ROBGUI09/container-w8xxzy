from flask import Flask, Response, request
import requests

app = Flask(__name__)
app.config['DEBUG'] = True

@app.route("/")
def index():
    return 'hi'


@app.route("/health")
def health():
    return "OK"

@app.route("/dns-query",methods=["GET","POST"])
def proxy():
    path = "/dns-query"
    SITE_NAME = "https://localhost:3000"
    if request.method=="GET":
        resp = requests.get(f"{SITE_NAME}{path}",verify=False)
        excluded_headers = ["content-encoding", "content-length", "transfer-encoding", "connection"]
        headers = [(name, value) for (name, value) in  resp.raw.headers.items() if name.lower() not in excluded_headers]
        response = Response(resp.content, resp.status_code, headers)
        return response
    elif request.method=="POST":
        resp = requests.post(f"{SITE_NAME}{path}",data=request.form,verify=False)
        excluded_headers = ["content-encoding", "content-length", "transfer-encoding", "connection"]
        headers = [(name, value) for (name, value) in resp.raw.headers.items() if name.lower() not in excluded_headers]
        response = Response(resp.content, resp.status_code, headers)
        return response


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)
