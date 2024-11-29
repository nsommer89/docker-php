FROM nsommer89/base:latest

ARG DEBIAN_FRONTEND=noninteractive
ARG PHP_VERSION=8.3

# Install PHP
RUN \
    mkdir /run/php && \
    apt update -y && \
    apt upgrade -y && \
    apt-get update && apt install software-properties-common gettext-base patch -y && \
    add-apt-repository ppa:ondrej/php && \
    apt-get update -y && apt-get install -y --no-install-recommends \
    # Install php${PHP_VERSION}-fpm, cli and common extensions
    php${PHP_VERSION} \
    php${PHP_VERSION}-cli \
    php${PHP_VERSION}-fpm \
    # Install php${PHP_VERSION} extensions
    php${PHP_VERSION}-common \
    php${PHP_VERSION}-zip \
    php${PHP_VERSION}-mysql \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-gd \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-xml \
    php${PHP_VERSION}-xmlrpc \
    php${PHP_VERSION}-intl \
    php${PHP_VERSION}-readline \
    php${PHP_VERSION}-bcmath \
    php${PHP_VERSION}-imagick \
    php${PHP_VERSION}-redis \
    php${PHP_VERSION}-sqlite3 && \
    # Clean up
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ARG PHP_VERSION=8.3

# Copy configuration files
ADD ./www.conf /etc/php/${PHP_VERSION}/fpm/pool.d/www.conf

# Open ports
EXPOSE 9000

ARG PHP_VERSION=8.3

# Start PHP-FPM
CMD ["/usr/sbin/php-fpm8.3", "-R", "-F", "-y", "/etc/php/8.3/fpm/php-fpm.conf"]