FROM nginx:1.7

ENV DEBIAN_FRONTEND noninteractive

RUN echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup
RUN echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache
RUN echo "Europe/Paris" > /etc/timezone; dpkg-reconfigure tzdata

RUN apt-get update -y

RUN apt-get install -y nginx
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

ADD conf.d/sisfarma.conf /etc/nginx/conf.d/sisfarma.conf.base
ADD run.sh /usr/local/bin/run.sh

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/run.sh"]
