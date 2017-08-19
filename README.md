# OpenStack client

This repository contains Dockerfile to build image with OpenStack client.

# Download

```bash
docker pull ozerov/openstackclient
```

# Usage

## If you have admin-openrc

```bash
# If you are using bash or zsh
docker run --rm -it \
  -v $(pwd)/admin-openrc:/root/admin-openrc \
  ozerov/openstackclient bash
# If you are using fish
docker run --rm -it \
  -v (pwd)/admin-openrc:/root/admin-openrc \
  ozerov/openstackclient bash
# Source file inside a container and run openstackclient
source /root/admin-openrc
openstack server list
```

## Without admin-openrc

```bash
# Export all needed variables and run openstackclient
docker run --rm \
  -e OS_PROJECT_DOMAIN_NAME='domain_name' \
  -e OS_USER_DOMAIN_NAME='domain_name' \
  -e OS_PROJECT_NAME='project_name' \
  -e OS_USERNAME='username' \
  -e OS_PASSWORD='password' \
  -e OS_AUTH_URL='auth_url' \
  -e OS_IDENTITY_API_VERSION='3' \
  -e OS_IMAGE_API_VERSION='2' \
  ozerov/openstackclient \
  openstack server list
```
