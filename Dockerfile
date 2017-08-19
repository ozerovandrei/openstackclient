FROM ubuntu:16.04
LABEL maintainer="flunk13@gmail.com"
LABEL version="1.0.0"
RUN apt update && \
    apt -y install \
      curl \
      python-pip \
      python-dev \
      python3-dev \
      git \
      libxml2-dev \
      libxslt1-dev \
      python-openssl \
      python3-openssl \
      python-pyasn1 \
      libffi-dev \
      libssl-dev \
      build-essential
RUN pip install -UI pip
RUN pip install -UI pbr setuptools pytz
RUN pip install -UI git+https://github.com/openstack/python-openstackclient
CMD ["bash"]
