all: up

up:
	docker-compose -f srcs/docker-compose.yml up --build -d

down:
	docker-compose down -v

clean:
	docker system prune -af

re: clean up