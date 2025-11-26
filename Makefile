

all: build
	mkdir -p /home/hchadili/data/wordpress
	mkdir -p /home/hchadili/data/mariadb
	mkdir -p /home/hchadili/data/portainer
	sudo docker compose  -f ./srcs/docker-compose.yml up
	

build: clean
	sudo docker compose  -f ./srcs/docker-compose.yml build 
	sudo docker image prune -f

clean:
	sudo docker compose -f ./srcs/docker-compose.yml down 
fclean:
	sudo docker compose -f ./srcs/docker-compose.yml down -v