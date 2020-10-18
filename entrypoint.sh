#!/bin/bash

service i2pd start
echo "Starting I2p and Garlic tunnels"

sleep 30

b32=$(./lib/b32.sh)
echo "I2p address: $b32.b32.i2p"

ipv6=$(./lib/ipv6.sh $b32)
echo "IPv6: $ipv6"

echo "$ipv6 $b32.b32.i2p" > hosts.gc

echo "Hosts file:"
cat hosts.gc

# TODO check if tun exists
./lib/tun.sh

echo "To start gcat run:"
echo "./lib/garlicat.sh $b32.b32.i2p"

cd ui && bundle install && puma -b tcp://0.0.0.0:9871
