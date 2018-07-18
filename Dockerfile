FROM alpine:latest
LABEL maintainer="andrei.ozerov92@gmail.com"
LABEL version="1.0.6"

RUN apk update && apk upgrade && \
    apk add --no-cache \
    bash \
    bash-completion \
    ca-certificates \
    gcc \
    git \
    libffi \
    libffi-dev \
    linux-headers \
    musl-dev \
    openssl-dev \
    python \
    python-dev && \
    python -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    rm -rf /var/cache/apk/*

RUN pip install -UI pip
RUN pip install -UI \
    pbr \
    setuptools \
    pytz \
    git+https://github.com/openstack/python-openstackclient \
    git+https://github.com/openstack/python-magnumclient \
    git+https://github.com/openstack/python-heatclient \
    git+https://github.com/openstack/python-octaviaclient \
    git+https://github.com/gnocchixyz/python-gnocchiclient && \
    rm -r /root/.cache

COPY files/get_kubectl.sh /root/get_kubectl.sh
RUN chmod 755 /root/get_kubectl.sh

RUN openstack complete > /etc/profile.d/openstack_completions.sh && \
    echo "source /etc/profile" > /root/.bashrc

ENV HOME /root

WORKDIR /root

CMD ["/bin/bash"]
