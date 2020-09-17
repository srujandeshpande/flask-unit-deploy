# keep our base image as small as possible
FROM nginx/unit:1.19.0-python3.7

# port used by the listener in config.json
EXPOSE 8080

COPY requirements.txt /config/requirements.txt
RUN apt update && apt install -y python3-pip    \
    && pip3 install -r /config/requirements.txt \
    && rm -rf /var/lib/apt/lists/*

COPY config.json /docker-entrypoint.d/config.json
COPY app.py /www/app.py
