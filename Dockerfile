FROM resin/rpi-raspbian
MAINTAINER Gavin Adam <gavinadam80@gmail.com>

RUN apt-get update && apt-get install -y \
    freeradius-mysql \
    freeradius \
    ntp \
    mysql-client \
    --no-install-recommends && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN sed -i 's/debian/fr/g' /etc/ntp.conf && \
    echo 'Europe/Paris' > /etc/timezone && dpkg-reconfigure tzdata && \
    /etc/init.d/ntp restart && \
    mkdir -p /var/motp/cache && mkdir -p /var/motp/users && \
    chown -R freerad:freerad /var/motp && chgrp freerad /etc/freeradius/*

WORKDIR /etc/freeradius

COPY init.sh .

RUN chmod +x init.sh

CMD [ "./init.sh" ]
