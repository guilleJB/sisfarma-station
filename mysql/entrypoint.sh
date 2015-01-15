#!/bin/bash

if [ ! -f /var/lib/mysql/ibdata1 ]; then
    mysql_install_db > /dev/null
fi

exec /usr/bin/mysqld_safe