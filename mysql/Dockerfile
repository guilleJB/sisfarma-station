FROM ubuntu:14.04

ENV DEBIAN_FRONTEND noninteractive

RUN echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup
RUN echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache
RUN echo "Europe/Paris" > /etc/timezone; dpkg-reconfigure tzdata

RUN apt-get update -y
RUN apt-get install -y mysql-server

ADD entrypoint.sh /usr/local/bin/entrypoint.sh

WORKDIR /usr

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
