# OpenStack client

This repository contains Dockerfile to build image with OpenStack client.
Bash-completions are included.

## Download

```bash
docker pull ozerov/openstackclient
```

## Usage

### If you have an admin-openrc

```bash
# Run a container and provide the admin-openrc file to the OpenStack client
docker run --rm -it \
  -v $PWD/admin-openrc:/root/admin-openrc \
  ozerov/openstackclient

# Source the file inside a container and run the OpenStack client
source /root/admin-openrc
openstack server list
```

### If you don't have an admin-openrc

```bash
# Export all needed variables and run the OpenStack client
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
