FROM debian:wheezy

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /opt/slack-irc-bot

# Upgrade and install required packages
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y git curl supervisor

# Comment if the character set detector should not be built for node-irc
RUN apt-get install -y make g++ libicu-dev

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup | bash -
RUN apt-get install --fix-missing -y nodejs

# Install slack-irc-bot
RUN npm install slack-irc-bot

# Add configuration files
ADD config.js node_modules/slack-irc-bot/config/config.js
ADD supervisord.conf /supervisord.conf

# Start the supervisor
CMD ["-n", "-c", "/supervisord.conf"]
ENTRYPOINT ["/usr/bin/supervisord"]

# Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
