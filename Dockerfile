FROM ubuntu

USER root
WORKDIR /app

RUN apt update
RUN apt install -y openvpn i2pd
RUN apt install -y autoconf automake g++ make net-tools wget

RUN wget https://www.cypherpunk.at/ocat/download/Source/current/onioncat-0.3.8.tar.gz
RUN tar zxvf onioncat-0.3.8.tar.gz

RUN cd onioncat-0.3.8 && ./configure
RUN cd onioncat-0.3.8 && make
RUN cd onioncat-0.3.8 && make install
