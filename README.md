# Docker, docker-compose, dockerfile

## Создайте свой кастомный образ nginx на базе alpine  
1. Создаем Dockerfile  
```
#FROM alpine
#MAINTAINER Aleksey Sboev <sboevav@mail.ru>
#RUN yum -y install nginx
#RUN echo «daemon off;» >> /etc/nginx/nginx.conf
#EXPOSE 80
#CMD /usr/sbin/nginx -c /etc/nginx/nginx.conf

FROM centos:centos7
MAINTAINER Vitaly Natarov <solo.metal@bigmir.net>

# Configure my repo to use my custom Nginx with modsec
RUN mkdir -p /usr/local/src
RUN cd /usr/local/src
RUN yum -y install wget vim htop tar

# install repo for centos
# epel repo
RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
# remi repo
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
RUN yum repolist

# install nginx
RUN yum -y install nginx

# tell Nginx to stay foregrounded
ADD nginx.conf /etc/nginx/nginx.conf
RUN echo "daemon off;" >> /etc/nginx/nginx.conf8832d592de34
RUN mkdir -p /var/www
RUN curl https://git.centos.org/sources/httpd/c7/acf5cccf4afaecf3afeb18c50ae59fd5c6504910 \
| tar -xz -C /var/www \
--strip-components=1
RUN sed -i -e 's/Apache/nginx/g' -e '/apache_pb.gif/d' \
/var/www/index.html

# expose HTTP
EXPOSE 80
EXPOSE 8080
EXPOSE 443

# Run
CMD [ "/usr/sbin/nginx" ]
```
2. Установим необходимый инструментарий  
```
sudo apt  install docker.io
```
3. Приступаем к сборке контейнера  
	```
	docker build -t nginx:base
	```


## Определите разницу между контейнером и образом  
В терминологии докер: контейнер — это запущенный образ. Что из себя представляет изнутри сам образ, советую прочитать эту статью. Если грубо, то докеровский имейдж — это стопка более мелких имеджей, каждый из которых содержит файлы, команды, результат их выполнения и другую мета-инфу. Потом драйвер overlay при запуске все это собирает в заданном порядке и из контейнера это выглядит как цельная единая система. Помимо этого, при старте контейнера поверх всего создается новый слой/имейдж. При удалении контейнера по сути только этот слой и удаляется со всеми изменениями произошедшими во время жизни контейнера, однако их можно “закоммитить” создав новый образ.
Текстовым представлением докеровского образа является Dockerfile. При команде docker build этот файл считывается, каждая строка-команда запускает новый контейнер, а ее результат коммитится в новый слой/имейдж


## Ответьте на вопрос: Можно ли в контейнере собрать ядро?  

## Создайте кастомные образы nginx и php, объедините их в docker-compose  

