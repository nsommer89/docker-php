FROM nsommer89/base:latest

RUN \
    # Install nginx
    apt update && \
    apt-get install -y --no-install-recommends nginx && \
    # Clean up
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Copy configuration files
ADD ./example.com.conf /etc/nginx/sites-available/example.com.conf

# Enable site
RUN ln -s /etc/nginx/sites-available/example.com.conf /etc/nginx/sites-enabled/example.com.conf

# Open ports
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]