all: up

up:
@mkdir -p /home/mohamedmaq/Desktop/data/wp \
		/home/mohamedmaq/Desktop/data/db
	@docker-compose -f ./src/docker-compose.yml up
down:
	@docker-compose -f ./src/docker-compose.yml down
	
start:
	@docker-compose -f ./src/docker-compose.yml start

stop:
	@docker-compose -f ./src/docker-compose.yml stop

clean: stop down
	@docker-compose -f ./src/docker-compose.yml down -v
	@docker system prune -af
	@rm -rf /home/mohamedmaq/Desktop/data
	@docker rm $$(docker ps -qa)
	@docker volume rm $$(docker volume ls)

.PHONY: all clean fclean re