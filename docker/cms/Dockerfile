FROM php:8.2-apache  

USER root

WORKDIR /var/www/html

RUN apt-get update && \
    apt-get install -y libonig-dev libzip-dev unzip mariadb-client && \
    docker-php-ext-install pdo pdo_mysql mysqli zip

COPY ./docker/resources/core.tar /tmp/core.tar

RUN tar -xvf /tmp/core.tar -C /var/www/html --strip-components=1 && \
    rm /tmp/core.tar

RUN mkdir -p /var/www/html/wp-content && \
    chown -R www-data:www-data /var/www/html/wp-content && \
    chmod -R 775 /var/www/html/wp-content

RUN sed -i 's/80/8080/' /etc/apache2/ports.conf /etc/apache2/sites-enabled/000-default.conf

RUN mv "$PHP_INI_DIR"/php.ini-development "$PHP_INI_DIR"/php.ini

RUN echo "memory_limit=256M" > "$PHP_INI_DIR"/conf.d/99-custom.ini

RUN apt-get update && \
    apt-get install -yq mariadb-client netcat-openbsd sudo less git unzip

RUN curl -sL https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp && \
    chmod +x /usr/local/bin/wp && \
    mkdir /var/www/.wp-cli && \
    chown www-data:www-data /var/www/.wp-cli

RUN curl -sL https://raw.githubusercontent.com/composer/getcomposer.org/master/web/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    mkdir /var/www/.composer && \
    chown www-data:www-data /var/www/.composer

RUN sudo -u www-data composer global config --no-plugins allow-plugins.dealerdirect/phpcodesniffer-composer-installer true

RUN sudo -u www-data composer global require \
    phpunit/phpunit \
    dealerdirect/phpcodesniffer-composer-installer \
    phpcompatibility/phpcompatibility-wp \
    automattic/vipwpcs

RUN chown -R www-data:www-data /var/www/html

ENV PATH="/var/www/.composer/vendor/bin:${PATH}"

EXPOSE 8080
