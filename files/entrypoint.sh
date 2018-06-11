#!/bin/bash

# One purpose of this file is to copy environment variables into files. The
# host keys, and authorized keys for the SSH server needs to be particular per
# host. In a Docker environment, the easiest way to do that is through
# environment variables. The contents should be base64 encoded.
#
# Another purpose is to start the sshd server and Apache (to server gitweb).

mkdir -p /root/.ssh
echo "$AUTHORIZED_KEYS" | base64 -d > /authorized_keys

for var in _etc_ssh_ssh_host_ecdsa_key _etc_ssh_ssh_host_ecdsa_key_pub _etc_ssh_ssh_host_ed25519_key _etc_ssh_ssh_host_ed25519_key_pub _etc_ssh_ssh_host_rsa_key _etc_ssh_ssh_host_rsa_key_pub; do
    fn=$(echo $var | sed 's/_pub$/.pub/; s#_etc_ssh_#/etc/ssh/#;')
    echo ${!var} | base64 -d > $fn
done

if test "$SELF_HOSTED" = "true" -a ! -d /git/nohubs-site; then
    chown -R git:git /usr/share/gitweb
    su git -c "
        mkdir -p /git/nohubs-site;
        cd /git/nohubs-site;
        git init --bare --shared;
        echo \"Self hosted; this site's assets.\" > description;
        touch git-daemon-export-ok;
        echo -e \"#!/bin/sh\ncd /usr/share/gitweb && git --git-dir=.git pull --rebase local master\" > hooks/post-update;
        chmod +x hooks/post-update;

        cd /usr/share/gitweb;
        git init;
        git config user.email docker-entrypoint@localhost;
        git config user.name 'Docker Entrypoint';
        git remote add local /git/nohubs-site;
        git add .;
        git commit -m \"Initialized from entrypoint.sh.\";
        git push local master;
    "
fi

service ssh start
service apache2 start
git daemon --listen=0.0.0.0 --reuseaddr --base-path=/git/ /git/ &

echo
echo sshd and apache2 are now running so you should be able to SSH in.
echo
echo TODO: Add documents and stuff.
echo

"$@"
