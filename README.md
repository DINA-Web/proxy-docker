# dw-proxy

A reverse proxy based on nginx, capable of automatically fetching, installing and renewing SSL certificates using its `letsencrypt` companion at no cost. So using it saves a lot of manual maintenance steps.

# Usage

Firstly, `docker` and `docker-compose` are required.

Run only one instance of this component on the server to get a reverse proxy with SSL support in front of other services.

The other services then only need to add three environment variables which will route traffic to them. In the `docker-compose.yml` file of the service, add something along these lines to expose it under a specific name with SSL support provided from `dw-proxy`:

		environment:
		  - VIRTUAL_HOST=beta-sso.dina-web.net
		  - LETSENCRYPT_HOST=beta-sso.dina-web.net
		  - LETSENCRYPT_EMAIL=dina@mail.dina-web.net


# Good to know

The proxy is a singleton (it binds on and accepts traffic on port 80 and 443 only, re-routing it) so it shouldn't run in multiple instances. Therefore it can have a "global" server-wide container names, here we use "proxy" for nginx and "letsencrypt" for the SSL certificate companion. 

The `docker-compose.yml` file also uses "restart: always" to work around some errors that otherwise will appear due to asynchronous service starts where the companion components needs a file not yet available from the nginx component.

# CLI commands for deploying


Then get the code with `git` and run the component with `make`:

		sudo apt-get install make git
		mkdir -p repos && cd repos
		git clone <slug-for-this-repo>
		make

# References

- https://hub.docker.com/r/jrcs/letsencrypt-nginx-proxy-companion/
- https://www.nginx.com/resources/admin-guide/reverse-proxy/
- https://hub.docker.com/r/jwilder/nginx-proxy/

