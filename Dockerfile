FROM ubuntu:trusty

RUN apt-get update && \
    apt-get install -y nginx spawn-fcgi php5-cli php5-cgi 

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

EXPOSE 443

WORKDIR /usr/share/nginx/html

COPY run.sh /run.sh
RUN  chmod +x /run.sh

CMD ["/run.sh"]

COPY server* /etc/nginx/

COPY nginx-site /etc/nginx/sites-available/default

COPY phpinfo.php /usr/share/nginx/html/

