FROM debian:buster

RUN apt update && apt install -y nginx openssl

RUN mkdir -p /etc/nginx/certs/

COPY nginx.conf /etc/nginx/nginx.conf

RUN openssl req -x509 -nodes \
-out /etc/nginx/certs/nginx.crt \
-keyout /etc/nginx/certs/nginx.key \
-subj "/C=FR/ST=Haut-Rhin/L=Mulhouse/O=42Mulhouse/OU=42Mulhouse/CN=mgovinda.42.fr/UID=mgovinda" 

RUN chmod 600 /etc/nginx/certs/nginx.*

RUN rm /var/www/html/index.nginx-debian.html

EXPOSE 4431

CMD ["nginx", "-g", "daemon off;"]
