# PhotonBot
Cross-server successor of ruibot - IRC bot.

# Help
To configure and start this bot:
1. Copy `servers.sample.yaml` to `servers.yaml` and enter valid config there (see below)
2. Configure cmdchar on `cmd/core.rb`

# `servers.yaml`
This bot is cross-server. So each root entry in this file - hash which describes how to connect to server.

Required options:
- `enabled` - if `false`, launcher will not start bot for this server.
- `host` - address of server
- `port` - port of server
- `user` - your username
- `nick` - your nickname
- `pass` - your password (do not provide if no pass)
- `use_pass` - disable if you are not using pass
- `autoowner` - this will make entered hostmask owner while generating database
- `autojoin` - bot will autojoin channels in this array

Sample config:
```yaml
freenode:
  enabled: true

  host: irc.freenode.net
  port: 6667

  user: ruibot
  nick: PhotonBot
  rname: Yet another bot. Written in ruby. Now multiservered and multithreaded.
  pass: <hidden>
  use_pass: true
  autojoin: 
    - "#PhotonBot"

  autoowner: "unaffiliated/handicraftsman"
```
