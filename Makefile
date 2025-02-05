NAME = laravel-vue-docker
DOCKER_COMPOSE = docker compose

all:
	$(DOCKER_COMPOSE) build
	$(DOCKER_COMPOSE) up

clean:
	$(DOCKER_COMPOSE) down

fclean: clean
	@sudo ./clean.sh
	docker volume prune -f
	# If you want to remove images entirely, uncomment:
	# docker image prune -a -f
	docker network prune -f

re: fclean all

.PHONY: all clean fclean re
