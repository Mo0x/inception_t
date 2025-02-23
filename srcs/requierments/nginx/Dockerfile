FROM debian:bullseye

RUN apt update && apt install -y nginx openssl

#SSL

RUN mkdir -p /etc/nginx/ssl && openssl req -x509 -nodes -days 365 -newkey:2048 \
	-keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt \
	-subj "/C=FR/ST=Alsace/L=Mulhouse/O=42School/OU=IT/CN=${DOMAIN_NAME}

COPY nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]