all: build
	sudo docker compose  -f ./srcs/docker-compose.yml up 

build: clean
	sudo docker compose  -f ./srcs/docker-compose.yml build 

clean:
	sudo docker compose -f ./srcs/docker-compose.yml down 
fclean:
	sudo docker compose -f ./srcs/docker-compose.yml down -v