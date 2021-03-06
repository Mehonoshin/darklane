FROM ubuntu

USER root
WORKDIR /app

RUN apt update -y
RUN apt install -y i2pd autoconf automake g++ make net-tools wget curl ruby ruby-dev iputils-ping
RUN gem install bundler -N

RUN wget https://www.cypherpunk.at/ocat/download/Source/current/onioncat-0.3.8.tar.gz
RUN tar zxvf onioncat-0.3.8.tar.gz

RUN cd onioncat-0.3.8 && ./configure && make && make install

COPY lib/openvpn-install.sh /app/openvpn-install.sh
RUN chmod +x openvpn-install.sh
RUN AUTO_INSTALL=y ./openvpn-install.sh

COPY config/garlicat.conf /etc/i2pd/tunnels.conf.d/garlicat.conf
COPY config/i2pd.conf /etc/i2pd/i2pd.conf
COPY entrypoint.sh /app/entrypoint.sh
COPY lib /app/lib
COPY ui /app/ui
COPY config /app/config

RUN cd /app/ui && bundle install

EXPOSE 7070 9871 1194

ENTRYPOINT ["/app/entrypoint.sh"]
