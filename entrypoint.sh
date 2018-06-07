#!/bin/bash

# One purpose of this file is to copy environment variables into files. The
# host keys, and authorized keys for the SSH server needs to be particular per
# host. In a Docker environment, the easiest way to do that is through
# environment variables. The contents should be base64 encoded.
#
# Another purpose is to start the sshd server and Apache (to server gitweb).

mkdir -p /root/.ssh
echo "$AUTHORIZED_KEYS" | base64 -d > /root/.ssh/authorized_keys

for var in _etc_ssh_ssh_host_ecdsa_key _etc_ssh_ssh_host_ecdsa_key_pub _etc_ssh_ssh_host_ed25519_key _etc_ssh_ssh_host_ed25519_key_pub _etc_ssh_ssh_host_rsa_key _etc_ssh_ssh_host_rsa_key_pub; do
    fn=$(echo $var | sed 's/_pub$/.pub/; s#_etc_ssh_#/etc/ssh/#;')
    echo ${!var} | base64 -d > $fn
done

service ssh start
service apache2 start

echo
echo sshd and apache2 are now running so you should be able to SSH in.
echo
echo TODO: Add documents and stuff.
echo

"$@"
