FROM debian:stretch

RUN apt update && \
    apt install --assume-yes \
        openssh-server \
        gitweb \
        highlight \
    && rm -rf /var/lib/apt/lists/*

RUN adduser --home /git --disabled-password git

COPY ./files/gitweb.conf /etc/

COPY ./files/sshd_config /etc/ssh/
COPY ./files/regenerate-host-keys /bin/
RUN chmod +x /bin/regenerate-host-keys

RUN a2enmod cgid
RUN sed -i 's#DocumentRoot .\+#DocumentRoot /usr/share/gitweb#' /etc/apache2/sites-enabled/000-default.conf
COPY ./files/mkrepo /bin/
RUN chmod +x /bin/mkrepo
COPY ./files/fork /bin/
RUN chmod +x /bin/fork
WORKDIR /root
RUN ln -sf /var/lib/git/ ./code

COPY ./files/motd /etc/
COPY ./files/entrypoint.sh /bin/
RUN chmod +x /bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]
