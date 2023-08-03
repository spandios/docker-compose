.PHONY: init
init:
	Make down && docker-compose rm && docker-compose up --build -d

.PHONY: init-m
init-m:
	Make down && Make download-migrations && docker-compose rm && docker-compose up --build -d

.PHONY: migrate
migrate:
	Make download-migrations && docker-compose restart migration-postgres

.PHONY: connect-mysql
connect-mysql:
	docker exec -it mysql bash

.PHONY: connect-postgres
connect-postgres:
	docker exec -it postgres bash

.PHONY: start
start:
	docker-compose up -d

.PHONY: stop
stop:
	docker-compose stop

.PHONY: down
down:
	docker-compose down -v && docker-compose rm

.PHONY: download-migrations
download-migrations:
	rm -rf migrations && mkdir migrations && rm -rf sql-for-migrations &&git clone 'https://gitlab.arbeon.com/merge-development/backend-sg/joel/sql-for-migrations.git' && mv sql-for-migrations/* ./migrations && rm -rf sql-for-migrations

.PHONY: clear
clear:
	docker-compose down -v --rmi all

