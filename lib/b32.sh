#!/bin/bash

a=$(curl -s http://localhost:7070/?page=i2p_tunnels | grep garlicat-server)
regex='(.*) ([a-z0-9]+)'

[[ "$a" =~ $regex ]]

b32="${BASH_REMATCH[2]}"

# TODO: validate b32
echo $b32

