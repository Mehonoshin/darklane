#!/bin/bash

cp /app/config/openvpn.conf /etc/openvpn/server.conf

if [[ $1 == "leader" ]]; then
  sed -i 's/server 10.8.0.0/server 10.8.1.0/' /etc/openvpn/server.conf
else
  sed -i 's/server 10.8.0.0/server 10.8.2.0/' /etc/openvpn/server.conf
fi
