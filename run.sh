#!/bin/bash

spawn-fcgi -a 127.0.0.1 -p 9000 -C 10 -u www-data -f /usr/bin/php-cgi

service nginx start
