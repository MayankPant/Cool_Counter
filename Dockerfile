FROM python:3.10-slim

RUN pip install --upgrade pip

ENV PYTHONBUFFERED=1

COPY ./requirements.txt .

RUN apt-get update -y
RUN apt-get install pkg-config -y
RUN apt-get install -y python3-dev build-essential
RUN apt-get install -y default-libmysqlclient-dev

RUN pip install -r requirements.txt

COPY .. /app    

WORKDIR /app

COPY ./entrypoint.sh /

ENTRYPOINT [ "sh", "/entrypoint.sh" ]
