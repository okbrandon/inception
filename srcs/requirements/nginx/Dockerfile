FROM alpine:3.17

RUN apk update \
 && apk add --no-cache nginx openssl

RUN mkdir -p /run/nginx /etc/nginx/ssl /var/www/html

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/nginx/ssl/bsoubaig-selfsigned.key \
	-out /etc/nginx/ssl/bsoubaig-selfsigned.crt \
	-subj "/C=FR/ST=PACA/L=Nice/O=42/OU=bsoubaig/CN=bsoubaig.42.fr"

RUN chmod -R 755 /var/www/html

COPY ./conf/nginx.conf /etc/nginx/

CMD ["nginx", "-g", "daemon off;"]
