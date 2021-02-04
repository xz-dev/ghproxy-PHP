FROM nginx:alpine

# 复制配置文件
COPY ./ghproxy.conf /etc/nginx/conf.d/ghproxy.conf
COPY ./html /var/www/ghproxy

RUN mkdir -p /etc/nginx/certs/
