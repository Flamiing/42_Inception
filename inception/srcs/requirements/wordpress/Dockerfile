FROM debian:buster

# We allow the port:
EXPOSE 9000

# Update and upgrade:
RUN apt-get update -y && apt-get upgrade -y

# Install wget:
RUN apt-get -y install wget

# Install PHP and its dependencies:
RUN apt-get -y install php7.3 php-fpm php-mysql mariadb-client

# Copy PHP config file:
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# Download wordpress into the folder we specified our main folder in the nginx container:
RUN wget https://wordpress.org/wordpress-6.3.tar.gz -P /var/www

# Change working directory:
WORKDIR /var/www

# Decompress the file and removes the .tar
RUN tar -xzf wordpress-6.3.tar.gz && rm -rf wordpress-6.3.tar.gz

# We give root rights to run in this folder:
RUN chown -R root:root /var/www/wordpress

# Install the CLI:
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Gives rights to the CLI and place it in the binaries:
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# Copy setup script:
COPY ./tools/wordpress_setup.sh /usr/local/bin

# Give execution permissions to the setup script:
RUN chmod +x /usr/local/bin/wordpress_setup.sh

# Change working directory:
WORKDIR /

ENTRYPOINT [ "bash", "/usr/local/bin/wordpress_setup.sh" ]
