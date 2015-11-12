FROM debian:jessie
MAINTAINER Patrick White "whitep@vcu.edu"

RUN apt-get update && apt-get install -y wget

RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62
RUN echo "deb http://nginx.org/packages/mainline/debian/ jessie nginx" >> /etc/apt/sources.list

## logstash forwarder
RUN echo "deb http://packages.elastic.co/logstashforwarder/debian stable main" >> /etc/apt/sources.list.d/logstashforwarder.list
RUN wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add -
ENV NGINX_VERSION 1.9.6-1~jessie

RUN apt-get update && \
    apt-get install -y logstash-forwarder ca-certificates nginx=${NGINX_VERSION} && \
    rm -rf /var/lib/apt/lists/*

RUN rm -v /etc/nginx/nginx.conf
ADD config/nginx.conf /etc/nginx/
ADD config/logstash-forwarder.conf /opt/logstash/patterns/
# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log


VOLUME ["/var/cache/nginx"]

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
