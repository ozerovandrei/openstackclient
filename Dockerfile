FROM alpine:latest
LABEL maintainer="andrei.ozerov92@gmail.com"
LABEL version="1.1.1"

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
    openssl \
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

RUN apk del --purge --no-cache \
    ca-certificates \
    gcc \
    git \
    libffi \
    libffi-dev \
    linux-headers \
    musl-dev \
    openssl-dev \
    python-dev && \
    rm -rf /var/cache/apk/*

COPY files/get_kubectl.sh /root/get_kubectl.sh
RUN chmod 755 /root/get_kubectl.sh

RUN echo "export SHELL='/bin/bash'" > /etc/profile.d/env_variables.sh

RUN openstack complete > /etc/profile.d/openstack_completions.sh && \
    echo "source /etc/profile" > /root/.bashrc

RUN sed -i \
    's#root:x:0:0:root:/root:/bin/ash#root:x:0:0:root:/root:/bin/bash#g' \
    /etc/passwd

ENV HOME /root

WORKDIR /root

CMD ["/bin/bash"]
