FROM php:8-alpine

# 安装依赖

RUN apk add --no-cache --virtual .build-deps \
 	git unzip

# 启动程序
COPY ./ /app
WORKDIR /app


# Install Composer
ENV COMPOSER_ALLOW_SUPERUSER=1
RUN curl -sS https://getcomposer.org/installer | \
	php -- --install-dir=/usr/local/bin --filename=composer
RUN composer install 
RUN composer dump-autoload -o 

# 卸载多余软件
RUN apk del .build-deps

CMD ["php", "index.php"]
