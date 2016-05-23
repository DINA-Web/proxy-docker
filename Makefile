all: up

up: 
	docker-compose up -d

clean: 
	stop 

stop: 
	docker-compose stop

