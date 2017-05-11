# proxy-docker

A reverse proxy based on the NGINX Reverse Proxy

- https://www.nginx.com/resources/admin-guide/reverse-proxy
- https://hub.docker.com/r/jwilder/nginx-proxy

## Usage

If you are using SSL certs that you have acquired commercially and those are signed by a CA, put your files, ie shared.crt (dina-web.net.crt) and shared.key (dina-web.net.key) in the 'certs' -directory.

You can also generate self-signed certs. Detailed steps:

		# on first run, you can use
		make

		# to generate self-signed certs use
		make ssl-certs

		# inspect ssl cert in use with
		make ssl-certs-show

If you have bought certs, put them in the certs directory and do NOT run `make ssl-certs` again, as that would overwrite files.

## Self-signed certs

Using self-signed certificates will require either the CA cert to be imported and installed either system-wide or in each of your apps. If you don't do this, apps will fail to request data using SSL (https).

So, besides configuring those certs for use in the backend services, you also need to:

- import the /tmp/certs/ca.pem file into Firefox/Chrome or other browsers or clients that you are using on the client side

Pls search for documentation on how to do it, for example:

https://support.mozilla.org/en-US/questions/995117

NB: For curl to work, you need to provide '--cacert /tmp/certs/ca.pem' switch or SSL requests will fail. 






