FROM php:7.4-cli

LABEL version="0.1"
LABEL repository="https://github.com/Louzet/symfony-action"
LABEL homepage="https://github.com/Louzet/symfony-action"
LABEL maintainer="Mickael Louzet <micklouzet@hotmail.fr>"

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Make entrypoint.sh file executable:
RUN chmod +x /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]