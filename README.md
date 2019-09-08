Docker deployment of [Tiny Tiny RSS](https://tt-rss.org/) with HTTPS

# Introduction
Tiny Tiny RSS is a free and open source web-based news feed (RSS/Atom) reader and aggregator.
This repository provides the tools needed to host your own TTRSS server and access it through HTTPS.
Requires docker-compose.

# Installation
1. Run `update.sh` to download the current version from the git master branch.
2. Run `build-all.sh` to build the Frontend image (labeled as ttrss:frontend) and the MySQL image (labeled as ttrss:mysql).
3. Edit `config/mysql-variables` and change the root password (default is '1234').
4. Run `create-certificate.sh` to generate a self-signed certificate. Alternatively, you can use your own certificate.
5. Run `run.sh` to start the containers.
6. Open your web browser and go to `https://localhost/install/`.
7. Select MySQL database and fill in the credentials with user: 'root' and the password you configured previously. The default database is 'ttrss' (unless you changed it in the config) and the hostname is 'mysql'.
8. Refer to the [official installation guide](https://tt-rss.org/wiki/InstallationNotes) if you need help to finish the installation

# Description
* The src folder has the files needed to compile the Docker images. The frontend image is based on the official php image from Docker, and the mysql image is based on the official mysql image from Docker. They use the tags ttrss:frontend and ttrss respectively.
* The config folder contains the file 'mysql-variables.env', which is used to specify the environment variables to configure MySQL.
* The persist folder contains the folders which will be mounted in the containers to store files that persist when the services are shutdown. The 'html' folder contains the TTRSS web page. The 'mysql' folder contains the database. The 'ssl' folder contains the certificate to use with HTTPS and the private key.
* Script 'build-all.sh' runs each 'build.sh' script inside the Docker images source folders, which run `docker build .` and sets the corresponding tag.
* Script 'clear-persistent-data.sh' clear all the files inside the folder persist.
* Script 'generate-certificate.sh' generates a self-signed certificate.
* Script 'run.sh' runs `docker-compose` up.
* Script 'update.sh' downloads the current TTRSS version from the master git branch.
