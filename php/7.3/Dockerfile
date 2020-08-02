FROM php:7.3.19-apache-stretch

MAINTAINER Cadu Elias<github.com/caduelias>

RUN apt-get update && apt-get install -y \
    git \
    zlib1g-dev \
    unzip \
    unixodbc \
    unixodbc-dev \
    freetds-dev \
    freetds-bin \
    tdsodbc \
    libxml2-dev \
    libicu-dev \
    locales-all \
    task-brazilian-portuguese \
    ghostscript \
    libaio-dev \
    unixodbc \
    tdsodbc \
    libzip-dev \
    && docker-php-ext-install zip \
    && docker-php-ext-install sockets


# Set timezone
RUN rm /etc/localtime &&\
    ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime &&\
    "date"

# install pecl
RUN curl -O http://pear.php.net/go-pear.phar \
    ; /usr/local/bin/php -d detect_unicode=0 go-pear.phar

#Postgres Driver
RUN apt-get update && apt-get install -y \
    libpq-dev \
    libpng-dev \
    zip unzip \
    git \
    iputils-ping && \
    docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql && \
    docker-php-ext-install pdo pdo_pgsql pgsql && \
    docker-php-ext-install gd

# Microsoft SQL Server Prerequisites
RUN apt-get -y install unixodbc-dev
RUN pecl install sqlsrv pdo_sqlsrv
RUN docker-php-ext-install bcmath

# Driver Mysql Pdo
RUN docker-php-ext-install pdo pdo_mysql zip 
RUN docker-php-ext-install mysqli

#imagick
RUN export CFLAGS="$PHP_CFLAGS" CPPFLAGS="$PHP_CPPFLAGS" LDFLAGS="$PHP_LDFLAGS"
RUN apt-get install -y --no-install-recommends libmagickwand-dev \
    && pecl install imagick-3.4.3 \
    && docker-php-ext-enable imagick

RUN a2enmod rewrite \
    && a2enmod headers

#PHP INI
RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

#Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# SOAP api extension
RUN docker-php-ext-install soap \
    && docker-php-ext-install pdo intl mbstring \
    && docker-php-ext-configure pdo_dblib --with-libdir=/lib/x86_64-linux-gnu

#XDEBUG
RUN docker-php-ext-install pdo_dblib \
    && docker-php-ext-enable intl mbstring pdo_dblib