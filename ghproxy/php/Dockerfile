FROM php:8.0-buster

# 安装依赖
RUN apt-get update && \
	apt-get install git unzip -y && \
	apt-get clean
# 启动程序
COPY ./ /app
WORKDIR /app


# Install Composer
RUN curl -sS https://getcomposer.org/installer | \
	php -- --install-dir=/usr/local/bin --filename=composer
RUN composer install 
RUN composer dump-autoload -o 

# 卸载多余软件
RUN apt-get update && \
    apt-get remove git unzip -y && \
    apt-get autoremove --purge -y && \
    apt-get autoclean -y

CMD ["php", "index.php"]
