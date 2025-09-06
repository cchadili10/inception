all: 
	sudo docker compose  -f ./srcs/docker-compose.yml up 

build:
	sudo docker compose  -f ./srcs/docker-compose.yml build 

clean: 
	sudo docker compose -f ./srcs/docker-compose.yml down -v