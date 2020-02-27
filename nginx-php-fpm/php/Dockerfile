FROM alpine:latest
LABEL maintainer="Aleksey Sboev <sboevav@mail.ru>"

RUN apk update \
    && apk upgrade \
    && apk add nginx \
    && mkdir -p /run/nginx

#COPY nginx.conf /etc/nginx/conf.d/default.conf 
#COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

