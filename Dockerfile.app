FROM python:3.10-alpine

RUN pip3 install flask prometheus_flask_exporter
ENV FLASK_APP app.py
COPY app.py /app.py

CMD ["flask", "run", "--host", "0.0.0.0", "--port", "8080"]