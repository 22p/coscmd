FROM python:alpine

RUN apk update \
    && apk add --no-cache git py3-setuptools \
    && git clone https://github.com/22p/coscmd.git \
    && cd coscmd \
    && python setup.py install \
    && cd .. \
    && rm -rf coscmd/ \
    && apk del git \
    && rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/local/bin/coscmd"]
