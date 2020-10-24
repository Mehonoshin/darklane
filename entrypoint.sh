#!/bin/bash

echo "▬▬ι═══════ﺤ  Running node in $1 mode  -═══════ι▬▬"

# Start I2p router with proper gcat configs
service i2pd start
echo "▬▬ι═══════ﺤ  Starting I2p  -═══════ι▬▬"

# Give some time to warm up I2p
sleep 30

echo "▬▬ι═══════ﺤ  I2p  -═══════ι▬▬"
# Extract local I2p address
b32=$(./lib/b32.sh)
echo "$b32.b32.i2p"

echo "▬▬ι═══════ﺤ  IPv6  -═══════ι▬▬"
# Calculate corresponding IPv6 address
ipv6=$(./lib/ipv6.sh $b32)
echo "$ipv6"

# Persist IPv6-b32 mapping in hosts file
echo "$ipv6 $b32.b32.i2p" > hosts.gc

echo "▬▬ι═══════ﺤ  Hosts file  -═══════ι▬▬"
cat hosts.gc

echo "▬▬ι═══════ﺤ  Setting TUN device  -═══════ι▬▬"
# Create missing tun interface if needed
./lib/tun.sh

echo "▬▬ι═══════ﺤ  Starting OpenVPN  -═══════ι▬▬"
./lib/openvpn-configure.sh $1
service openvpn start

echo "▬▬ι═══════ﺤ  Starting UI  -═══════ι▬▬"
# Run UI app to manage hosts list
cd ui && puma -b tcp://0.0.0.0:9871
