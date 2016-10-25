NAME = dina/proxy
ME=$(USER)

all: build up

build:
	docker build --tag $(NAME) .

push:
	#docker login -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"

	docker push $(NAME)

release:
	build push

clean: stop rm

up:
	docker-compose up -d

stop:
	docker-compose stop

rm:
	docker-compose rm -vf
