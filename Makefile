SRC	:=	./srcs

all: $(SRC)/docker-compose.yml
	docker compose -f $(SRC)/docker-compose.yml up --build

clean:
	docker compose -f $(SRC)/docker-compose.yml down -v --rmi all --remove-orphans

fclean: clean
	rm -rf ${HOME}/data/mariadb/*
	rm -rf ${HOME}/data/wordpress/*
	docker system prune --volumes --all --force
	docker network prune --force
	docker volume prune --force

.PHONY: all clean fclean