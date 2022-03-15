FROM python:3.6-slim-buster
#FROM python:3.6-alpine
#FROM python:3.8-slim

RUN apt-get update && apt-get install -y \ 
    build-essential \ 
    curl \ 
    git \
    npm \
    && pip3 install --upgrade pip \
    && pip3 install awscli --upgrade \
    && npm install -g npm@latest \
    && npm install -g snyk \
    && npm install -g snyk-to-html \
    && apt-get install zip -y \
    && apt-get clean


RUN adduser --quiet --disabled-password --shell /bin/sh --home /home/dockeruser --uid 300 dockeruser

USER dockeruser
WORKDIR "/home/dockeruser"

RUN curl -sSLNO "https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py" && \
    python get-poetry.py --version 1.1.4
ENV PATH="${PATH}:/home/dockeruser/.poetry/bin"

CMD ["sh"]