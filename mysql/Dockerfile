FROM mysql:8.0

LABEL version="1.0.0" description="Imagem Mysql" maintainer="Cadu Elias<github.com/caduelias>"

RUN apt-get update && apt-get install -y \
    git \
    unzip \
    locales-all \
    task-brazilian-portuguese \
    curl \
    wget
    #Set timezone Brazil
RUN rm /etc/localtime &&\
    ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime &&\
    "date"