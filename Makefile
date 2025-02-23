all: up

up:
	docker-compose up --build -docker

down:
	docker-compose down -v

clean:
	docker system prune -af

re: clean up