from flask import Flask
from prometheus_flask_exporter import PrometheusMetrics
from requests import get
from os import environ

app = Flask(__name__)
metrics = PrometheusMetrics(app)

@app.route('/')
def main():
    req_a = get(environ.get("MICROSERVICE_A"))
    req_b = get(environ.get("MICROSERVICE_B"))
    return {"a_http_code": req_a.status_code, "a_result": req_a.text, "b_http_code": req_b.status_code, "b_result": req_b.text }

if __name__ == "__main__":
    app.run()
