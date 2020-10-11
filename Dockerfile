# Copyright (C) 2020 by Michael Graves
#
# Permission to use, copy, modify, and/or distribute this software for
# any purpose with or without fee is hereby granted.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT
# OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

FROM alpine:edge as final

RUN apk add asterisk asterisk-sounds-en asterisk-sounds-moh
COPY ${PWD}/entrypoint.sh /entrypoint.sh
COPY ${PWD}/initial-config.tgz /tmp/initial-config.tgz
RUN chmod 755 /entrypoint.sh
RUN mkdir /data
RUN mv /etc/asterisk /data/etc
RUN ln -s /data/etc /etc/asterisk
#RUN mv /var/db/asterisk /data/db
#RUN ln -s /data/db /var/db/asterisk
RUN mv /var/spool/asterisk /data/spool
RUN ln -s /data/spool /var/spool/asterisk
RUN mv /var/log/asterisk /data/log
RUN ln -s /data/log /var/log/asterisk
 
EXPOSE 5060/udp 5060/tcp 5061/udp 5061/tcp 8088/tcp 5038/tcp
 
VOLUME /data
 
ENTRYPOINT [ "/entrypoint.sh" ]

