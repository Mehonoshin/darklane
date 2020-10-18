build:
	docker build -t tunnel .

run:
	docker run --privileged --sysctl net.ipv6.conf.all.disable_ipv6=0 --cap-add NET_ADMIN --cap-add CAP_NET_ADMIN --cap-add CAP_NET_RAW -ti tunnel bash
