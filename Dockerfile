FROM ubuntu

USER root
RUN apt update
RUN apt install -y openvpn i2pd
RUN apt install -y autoconf automake g++ make net-tools wget curl ruby ruby-dev
RUN gem install bundler -N

RUN wget https://www.cypherpunk.at/ocat/download/Source/current/onioncat-0.3.8.tar.gz
RUN tar zxvf onioncat-0.3.8.tar.gz

RUN cd onioncat-0.3.8 && ./configure && make && make install

WORKDIR /app
COPY config/garlicat.conf /etc/i2pd/tunnels.conf.d/garlicat.conf
COPY config/i2pd.conf /etc/i2pd/i2pd.conf
COPY entrypoint.sh /app/entrypoint.sh
COPY lib /app/lib
COPY ui /app/ui

EXPOSE 7070 9871

ENTRYPOINT ["/app/entrypoint.sh"]
