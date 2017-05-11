# proxy-docker

This is a reverse proxy based on `nginx`, with some small customizations.

More documentation here:

- https://hub.docker.com/r/jwilder/nginx-proxy
- https://www.nginx.com/resources/admin-guide/reverse-proxy

# Certificates and setting up SSL

If you are using SSL certs that you have acquired commercially and those are signed by a CA, put your files, ie shared.crt (dina-web.net.crt) and shared.key (dina-web.net.key) in the 'certs' -directory.

You can also generate self-signed certs. Detailed steps:

		# on first run, you can use
		make

		# to generate self-signed certs use
		make ssl-certs

		# inspect ssl cert in use with
		make ssl-certs-show

### Commercial certs

If you have bought certs, put them in the certs directory and do NOT run `make ssl-certs` again, as that would overwrite files.

If you bought certs, you may have several files available:

		key.pem - your secret key originally used in your Certificate Signing Request
		cacert.pem - the Certificate Authority's chain of certs
		cert.pem - your signed (wildcard?) public cert

If so, then combine the last two files - the cacert.pem och cert.pem - into `combined.pem`. In the right order. Pls search Internet for instructions.

### Self-signed certs

Using self-signed certificates will require either the CA cert to be imported and installed either system-wide or in each of your apps. If you don't do this, apps will fail to request data using SSL (https).

So, besides configuring those certs for use in the backend services, you also need to:

- import the /tmp/certs/ca.pem file into Firefox/Chrome or other browsers or clients that you are using on the client side

Pls search for documentation on how to do it, for example:

https://support.mozilla.org/en-US/questions/995117

NB: For curl to work, you need to provide '--cacert /tmp/certs/ca.pem' switch or SSL requests will fail. 







