FROM php:7.4-apache

RUN apt-get update \
  && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev libmcrypt-dev \
  && mv /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled \
  && mv /etc/apache2/mods-available/include.load /etc/apache2/mods-enabled 

RUN /bin/sh -c a2enmod rewrite
RUN /bin/sh -c a2enmod include

COPY .htaccess /var/www/html/
COPY health-check.html /var/www/html/

# RUN sed -i 's/80/${PORT}/g' /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf
