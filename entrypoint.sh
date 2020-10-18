#!/bin/bash

service i2pd start
echo "Starting I2p and Garlic tunnels"

sleep 30

b32=$(./lib/b32.sh)
echo "I2p address: $b32"

ipv6=$(./lib/ipv6.sh $b32)
echo "IPv6: $ipv6"
