FROM python:3.12-slim

WORKDIR /app
RUN apt-get update && apt-get install -y libreoffice

COPY . /app

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

CMD ["flask", "run"]