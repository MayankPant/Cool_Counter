FROM python:3.10-alpine

RUN pip install --upgrade pip

ENV PYTHONBUFFERED=1

COPY ./requirements.txt .

RUN pip install -r requirements.txt

COPY .. /app

WORKDIR /app

COPY ./entrypoint.sh /

ENTRYPOINT [ "sh", "/entrypoint.sh" ]