FROM nginx:1.9.9

MAINTAINER Julian Strobl <julian@endocode.com>

RUN mkdir /etc/nginx/ssl/

RUN openssl req \
                -x509 \
                -nodes \
                -days 1 \
                -newkey rsa:4096 \
                -subj "/C=DE/ST=Berlin/L=Berlin/O=Endocode AG/OU=IT/CN=localhost" \
                -keyout /etc/nginx/ssl/nginx.key \
                -out /etc/nginx/ssl/nginx.crt

COPY default.conf /etc/nginx/conf.d/

CMD ["nginx", "-g", "daemon off;"]

