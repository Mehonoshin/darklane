FROM geti2p/i2p:latest

USER root
RUN apt update --allow-insecure-repositories
RUN apt install -y onioncat
RUN apt install -y openvpn
