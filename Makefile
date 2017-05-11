#!make

ME=$(USER)
all: build ssl-certs up

build:
	docker build -t dina/proxy:v0 .

ssl-certs:
	@echo "Generating SSL certs using https://hub.docker.com/r/paulczar/omgwtfssl/"
	docker run -v /tmp/certs:/certs \
		-e SSL_SUBJECT=dina-web.net \
		-e SSL_DNS=dina-web.net,www.dina-web.net,beta-api.dina-web.net,beta-sso.dina-web.net,beta-cm.dina-web.net \
	paulczar/omgwtfssl
	cp /tmp/certs/cert.pem certs/dina-web.net.crt
	cp /tmp/certs/key.pem certs/dina-web.net.key

	@echo "Using self-signed certificates will require either the CA cert to be imported system-wide or into apps"
	@echo "if you don't do this, apps will fail to request data using SSL (https)"
	@echo "WARNING! You now need to import the /tmp/certs/ca.pem file into Firefox/Chrome etc"
	@echo "WARNING! For curl to work, you need to provide '--cacert /tmp/certs/ca.pem' switch or SSL requests will fail."

ssl-certs-clean:
	rm -f certs/dina-web.net.crt certs/dina-web.net.key
	rm -f /tmp/certs

ssl-certs-show:
	#openssl x509 -in certs/dina-web.net.crt -text
	openssl x509 -noout -text -in certs/dina-web.net.crt

release:
	docker push -t dina/proxy:v0

clean: stop rm

up:
	docker-compose up -d

stop:
	docker-compose stop

rm:
	docker-compose rm -vf
