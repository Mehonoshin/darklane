build:
	docker build -t tunnel .

run:
	docker run -p 9871:9871 --privileged --sysctl net.ipv6.conf.all.disable_ipv6=0 --cap-add NET_ADMIN --cap-add CAP_NET_ADMIN --cap-add CAP_NET_RAW -ti tunnel bash

run2:
	docker run -p 9872:9871 --privileged --sysctl net.ipv6.conf.all.disable_ipv6=0 --cap-add NET_ADMIN --cap-add CAP_NET_ADMIN --cap-add CAP_NET_RAW -ti tunnel bash
