
FROM alpine:latest
LABEL maintainer="jedi5465"
LABEL description="This example Dockerfile installs NGINX and a simple webpage."
RUN apk add --update nginx && \
	rm -rf /var/cache/apk/* && \
	mkdir -p /tmp/nginx/
	
COPY files/nginx.conf /etc/nginx/nginx.conf
COPY files/default.conf /etc/nginx/conf.d/default.conf

# ADD files/html.tar.gz /usr/share/nginx/
COPY files/html /usr/share/nginx/html/


EXPOSE 80/tcp

ENTRYPOINT ["nginx"]

CMD ["-g", "daemon off;"]

