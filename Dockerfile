FROM nginx
#安装依赖
RUN apt-get update && \
	apt-get install php-cli php-fpm php-bcmath php-gd php-mbstring \
	php-mysql php-opcache php-xml php-zip php-json php-imagick -y && \
	apt-get clean
#启动程序
COPY ./ghproxy /ghproxy
WORKDIR /ghproxy

RUN mv /ghproxy/ghproxy.conf /etc/nginx/conf.d/

# Install Composer
RUN curl -sS https://getcomposer.org/installer | \
	php -- --install-dir=/usr/local/bin --filename=composer
RUN composer install 
RUN composer dump-autoload -o 

CMD ["bash", "startup.sh"]
