all: up

up:
	mkdir -p /home/mgovinda/data/wordpress
	mkdir -p /home/mgovinda/data/mariadb
	chmod 777 /home/mgovinda/data/wordpress
	chmod 777 /home/mgovinda/data/mariadb
	docker-compose -f srcs/docker-compose.yml up --build -d

down:
	docker-compose -f srcs/docker-compose.yml down -v

clean:
	docker-compose -f srcs/docker-compose.yml down -v
	docker system prune -af
	rm -rf /home/mgovinda/data

re: clean up