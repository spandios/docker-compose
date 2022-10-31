.PHONY: init
init:
	docker-compose down -v
	docker-compose stop
	docker-compose up --build -d

.PHONY: connect-mysql
connect-mysql:
	docker exec -it mysql bash

.PHONY: connect-postgres
connect-mysql:
	docker exec -it postgres bash

.PHONY: start
start:
	docker-compose up -d

.PHONY: stop
stop:
	docker-compose stop


.PHONY: down
stop:
	docker-compose down -d