all: up

up:
	docker-compose up -d

clean: stop rm

stop:
	docker-compose stop

rm:
	docker-compose rm -vf

