FROM debian:stretch

RUN apt update && \
    apt install --assume-yes \
        openssh-server \
        gitweb \
    && rm -rf /var/lib/apt/lists/*

COPY ./sshd_config /etc/ssh/
COPY ./regenerate-host-keys /bin/
RUN chmod +x /bin/regenerate-host-keys

RUN a2enmod cgid
RUN sed -i 's#DocumentRoot .\+#DocumentRoot /usr/share/gitweb#' /etc/apache2/sites-enabled/000-default.conf
COPY ./mkrepo /bin/
RUN chmod +x /bin/mkrepo
COPY ./addrepo /bin/
RUN chmod +x /bin/addrepo
WORKDIR /root
RUN ln -sf /var/lib/git/ ./code

COPY ./motd /etc/
COPY ./entrypoint.sh /bin/
RUN chmod +x /bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]
