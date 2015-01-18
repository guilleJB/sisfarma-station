#!/bin/sh
 
# Preprend the upstream configuration
 (echo "upstream sisfarma { server $APACHE_PORT_8080_TCP_ADDR:$APACHE_PORT_8080_TCP_PORT; }" && cat /etc/nginx/conf.d/sisfarma.conf.base) > /etc/nginx/conf.d/sisfarma.conf
  
# Log the resulting configuration file
  cat /etc/nginx/conf.d/sisfarma.conf
   
# Start nginx
   service nginx start
