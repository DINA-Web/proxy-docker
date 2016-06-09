# dw-proxy

A reverse proxy based on `nginx`, capable of automatically fetching, installing and renewing `letsencrypt`SSL certificates at no cost. So using it saves a lot of manual maintenance steps.

# Usage

Firstly, `docker` and `docker-compose` are required.

Run only one instance of this component on the server to get a reverse proxy with SSL support in front of other services.

The other services then only need to add three environment variables which will route traffic to them. In the `docker-compose.yml` file of the service, add something along these lines to expose it under a specific name with SSL support provided from `dw-proxy`:

		environment:
		  - VIRTUAL_HOST=beta-sso.dina-web.net
		  - LETSENCRYPT_EMAIL=dina@mail.dina-web.net

If you have already certs (wildcard certs for example), you put those in the ./certs directory so those are used instead of letsencrypt-generated certs.

If you need special headers across services, for example for "cors" purposes, add them in `./conf/dina.conf`.

# Good to know

The proxy is a singleton (it binds on and accepts traffic on port 80 and 443 only, re-routing it) so it shouldn't run in multiple instances. Therefore it can have a "global" server-wide container name, such as "proxy". 

The `docker-compose.yml` file also uses "restart: always" to work around some errors may otherwise will appear due to asynchronous service starts where the companion components needs a file not yet available from the nginx component.

# CLI commands for deploying


Then get the code with `git` and run the component with `make`:

		sudo apt-get install make git
		mkdir -p repos && cd repos
		git clone <slug-for-this-repo>
		make

# References

- https://hub.docker.com/r/eforce21/letsencrypt-nginx-proxy/~/dockerfile/
- https://www.nginx.com/resources/admin-guide/reverse-proxy/
- https://hub.docker.com/r/jwilder/nginx-proxy/

