Docker container for slack-irc-bot
===

### Installation
```
git clone https://github.com/kurkku/slack-irc-bot-docker.git
```

### Configuration

Copy `config.js.sample` to `config.js` make necessary changes.

See https://github.com/kurkku/slack-irc-bot for information about configuration options.

### Building and running the container

```
cd slack-irc-bot-docker
docker built -t slack-irc-bot-docker .
docker run -d -t slack-irc-bot-docker
```

### Notes

To enable the character set detector functionality in node-irc quite a few development packages are installed. If you want to disable the functionality, see `Dockerfile` and comment the required line.
