#!/bin/bash

# Start I2p router with proper gcat configs
service i2pd start
echo "Starting I2p and Garlic tunnels"

# Give some time to warm up I2p
sleep 30

# Extract local I2p address
b32=$(./lib/b32.sh)
echo "I2p address: $b32.b32.i2p"

# Calculate corresponding IPv6 address
ipv6=$(./lib/ipv6.sh $b32)
echo "IPv6: $ipv6"

# Persist IPv6-b32 mapping in hosts file
echo "$ipv6 $b32.b32.i2p" > hosts.gc

echo "Hosts file:"
cat hosts.gc

# TODO check if tun exists
# Create missing tun interface if needed
./lib/tun.sh

echo "To start gcat run:"
echo "./lib/garlicat.sh $b32.b32.i2p"

service openvpn start

# Run UI app to manage hosts list
cd ui && puma -b tcp://0.0.0.0:9871
