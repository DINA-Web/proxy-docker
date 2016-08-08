ME=$(USER)
all: up

clean: stop rm

up:
	docker-compose up -d

stop:
	docker-compose stop

rm:
	docker-compose rm -vf
