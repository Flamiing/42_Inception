FROM debian:buster

# We allow the port:
EXPOSE 3306

# Update and upgrade:
RUN apt update -y && apt upgrade -y

# Install MariaDB:
RUN apt-get install mariadb-server -y

# Copy config file for mysql:
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy setup script:
COPY ./tools/mariadb_setup.sh /usr/local/bin

# Give execution permission to setup script:
RUN chmod +x /usr/local/bin/mariadb_setup.sh

# Run setup script at entrypoint:
ENTRYPOINT [ "bash", "/usr/local/bin/mariadb_setup.sh" ]