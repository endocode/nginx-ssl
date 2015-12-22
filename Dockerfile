FROM nginx:1.9.9

MAINTAINER Julian Strobl <julian@endocode.com>

COPY default.conf /etc/nginx/conf.d/

CMD ["nginx", "-g", "daemon off;"]

