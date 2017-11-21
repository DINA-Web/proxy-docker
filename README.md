# dw-proxy
A reverse proxy based on the NGINX Reverse Proxy <br>
- https://www.nginx.com/resources/admin-guide/reverse-proxy/ <br>
- https://hub.docker.com/r/jwilder/nginx-proxy/ <br>
if you are using SSL, put your shared.crt (dina-web.net.crt) and shared.key(dina-web.net.key) in the 'certs'-directory

version 3 creates the network 'dwproxy_default' , other services use that network.
to list networks on this machine , type `docker network ls`
