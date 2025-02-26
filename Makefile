all: up

up:
	mkdir -p /home/mgovinda/data/wordpress
	docker-compose -f srcs/docker-compose.yml up --build -d

down:
	docker-compose -f srcs/docker-compose.yml down -v

clean:
	docker system prune -af
	rm -rf /home/mgovinda/data

re: clean up