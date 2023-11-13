all: up

up: 
	@bash srcs/requirements/wordpress/tools/make_dir.sh
	@bash srcs/requirements/nginx/tools/make_key.sh
	@docker-compose -f ./srcs/docker-compose.yml up -d

down : 
	@docker-compose -f ./srcs/docker-compose.yml down

build : 
	@docker-compose -f ./srcs/docker-compose.yml build

re : down build up 
    
stop : 
	@docker-compose -f ./srcs/docker-compose.yml stop

start : 
	@docker-compose -f ./srcs/docker-compose.yml start

status : 
	@docker-compose -f ./srcs/docker-compose.yml ps

clean: 
	docker stop $$(docker ps -q) || true
	docker rm $$(docker ps -qa) || true
	docker rmi -f $$(docker images -qa) || true
	docker volume rm $$(docker volume ls -q) || true
	docker network rm $$(docker network ls -q) || true

.PHONY: all up down start stop status re clean

