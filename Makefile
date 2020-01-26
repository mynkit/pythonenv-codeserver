run:
	docker-compose build
	docker-compose up -d
stop:
	docker stop code-server
	docker rm code-server
