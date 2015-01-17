FROM debian:wheezy

# Install packages
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get -y install apache2 apache2-doc apache2-utils supervisor git libapache2-mod-php5 php5-mysql pwgen php-apc php5-mcrypt php5-cli php5-json php5-intl

# Add image configuration and scripts
ADD start-apache2.sh /start-apache2.sh
ADD run.sh /run.sh

RUN chmod 755 /*.sh
ENV APACHE_PORT 8080
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
RUN sed -i "s/80/${APACHE_PORT}/g" /etc/apache2/ports.conf
RUN sed -i "s/short_open_tag = On/short_open_tag = Off/" /etc/php5/apache2/php.ini
RUN echo "date.timezone = Europe/Paris" >> /etc/php5/apache2/php.ini

ADD supervisord-apache2.conf /etc/supervisor/conf.d/supervisord-apache2.conf

# config to enable .htaccess
RUN a2enmod rewrite

# Configure /app folder with sample app
#RUN git clone https://github.com/fermayo/hello-world-lamp.git /app
#RUN mkdir -p /app && rm -fr /var/www/html && ln -s /app /var/www/html

#Enviornment variables to configure php
ENV PHP_UPLOAD_MAX_FILESIZE 10M
ENV PHP_POST_MAX_SIZE 10M

EXPOSE 80
CMD ["/run.sh"]
