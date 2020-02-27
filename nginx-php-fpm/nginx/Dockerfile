FROM alpine:latest
LABEL maintainer="Aleksey Sboev <sboevav@mail.ru>"

RUN apk update \
    && apk upgrade \
    && apk add nginx \
    && mkdir -p /run/nginx

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

