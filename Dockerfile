FROM resin/rpi-raspbian
MAINTAINER Gavin Adam <gavinadam80@gmail.com>

RUN apt-get update && apt-get install -y \
    freeradius-mysql \
    freeradius \
    --no-install-recommends && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget http://motp.sourceforge.net/bash/otpverify.sh -O /etc/freeradius/otpverify.sh && \
    chmod +x /etc/freeradius/otpverify.sh && \
    wget http://motp.sourceforge.net/dictionary.motp -O /etc/freeradius/dictionary.motp && \
    sed -i 's/.*\/usr\/share\/freeradius\/dictionary.*/&\n\$INCLUDE\t\/etc\/freeradius\/dictionary.motp/' /etc/freeradius/dictionary && \
    mkdir /var/motp && mkdir /var/motp/cache && mkdir /var/motp/users && chown -R freerad:freerad /var/motp && chgrp freerad /etc/freeradius/* && \

