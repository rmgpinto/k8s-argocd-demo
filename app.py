from flask import Flask
from prometheus_flask_exporter import PrometheusMetrics
from os import environ

app = Flask(__name__)
metrics = PrometheusMetrics(app)

@app.route('/')
def main():
    http_code = environ.get("HTTP_CODE")
    return 'OK', http_code

if __name__ == "__main__":
    app.run()
