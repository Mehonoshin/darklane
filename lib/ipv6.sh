#!/bin/bash

ipv6=$(ocat -I -i $1.b32.i2p)
echo $ipv6
