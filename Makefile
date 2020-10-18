build:
	docker build -t tunnel .

run:
	docker run -ti -p 7070:7070 tunnel bash
