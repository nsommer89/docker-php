#build container
FROM nsommer89/php:latest

# Set working directory
WORKDIR /var/www/html

# Copy application
COPY ./src .

# Install dependencies
RUN \
    # Install composer
    curl -sS https://getcomposer.org/installer -o composer-setup.php && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
    rm composer-setup.php && \
    # Install dependencies
    composer --version && \
    composer install --no-dev --no-interaction

CMD ["sleep", "240"]