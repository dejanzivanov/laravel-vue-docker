NAME = laravel-vue-docker
DOCKER_COMPOSE = docker compose

all:
	$(DOCKER_COMPOSE) build
	$(DOCKER_COMPOSE) up

clean:
	$(DOCKER_COMPOSE) down

fclean: clean
	@if [ -f ./clean.sh ]; then sudo ./clean.sh; fi
	docker volume prune -f
	# If you want to remove images entirely, uncomment:
	# docker image prune -a -f
	docker network prune -f

re: fclean all

start:
	$(DOCKER_COMPOSE) up -d

stop:
	$(DOCKER_COMPOSE) down

logs:
	$(DOCKER_COMPOSE) logs -f

.PHONY: all clean fclean re start stop logs
