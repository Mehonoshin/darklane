build:
	docker build -t tunnel .

run:
	docker run --cap-add CAP_NET_ADMIN --cap-add CAP_NET_RAW -ti tunnel bash
