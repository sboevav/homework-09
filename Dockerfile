FROM alpine:latest

RUN apk add nginx \
    && mkdir -p /run/nginx

COPY nginx.conf /etc/nginx/conf.d/default.conf 
COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]


#FROM alpine:latest
#RUN apk add nginx
#COPY nginx.conf /etc/nginx/conf.d/default.conf
#RUN mkdir -p /run/nginx
#COPY index.html /usr/share/nginx/html/index.html
#EXPOSE 80
#CMD ["nginx", "-g", "daemon off;"]

