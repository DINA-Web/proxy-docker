ME=$(USER)

all: build up

build:
	docker build -t dina/proxy:v0 .

release:
	docker push -t dina/proxy:v0

clean: stop rm

up:
	docker-compose up -d

stop:
	docker-compose stop

rm:
	docker-compose rm -vf
