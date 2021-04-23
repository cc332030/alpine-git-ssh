#!/bin/sh

set -e

ROOT_SSH_PATH=/root/.ssh
mkdir -p ${ROOT_SSH_PATH}

echo "
Host *
    ConnectTimeout 10
" >> ${ROOT_SSH_PATH}/config

if [ -n "$SSH_PRIVATE_KEY" ]
then
  ROOT_ID_RSA=${ROOT_SSH_PATH}/id_rsa
  echo "$SSH_PRIVATE_KEY" > ${ROOT_ID_RSA}
  chmod 600 ${ROOT_ID_RSA}
fi

USER_SSH_PATH=~/.ssh
mkdir -p ${USER_SSH_PATH}
cp -r ${ROOT_SSH_PATH}/* ${USER_SSH_PATH}
