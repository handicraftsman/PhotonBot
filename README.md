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

# Dev-help
- To add new command, use `oncmd(/regex/) do |m, data| ... end`
- To add help entry, use `CmdHelp.new "part", "name", "syntax", "description"`
- Don't forget to load all your command-files in `/cmd/loader.rb`

# DB
You always have access to all databases:
- To access server-native database, use `$dbs[m.bot.name]`
- To access other database, use `$dbs["servername"]`
More help about DB-access can be found [here](https://github.com/sparklemotion/sqlite3-ruby)

# About commands
`m` has next properties:
- `bot` - bot-class of this message
- `sender_raw` - raw sender-name. Looks like `nick!user@host`
- `target` - message target. It is channel-name or your nickname (if it's PM)
- `nick` - sender's nickname
- `user` - sender's username
- `host` - sender's hostname
- `sendto` - if message was sent to channel, it is channel name. If it's PM - sender's nickname.
`m` has next methods:
- `reply(msg)` - replies to sender with given message


More info about `data` can be found [here](https://ruby-doc.org/core-2.4.0/MatchData.html)

:name, :user, :nick, :rname, :pass, :use_pass, :host, :port, :autojoin, :autoowner

`m.bot` has next properties:
- `name` - name of current server
- `user` - bot's username
- `nick` - bot's nickname
- `rname` - bot's realname
- `pass` - bot's password
- `use_pass` - is password enabled?
- `host` - server-address
- `port` - server-port
- `autojoin` - array of channels which bot will join when connected
- `autoowner` - read above
`m.bot` has next methods:
- `write(raw)` - writes given message directly to socket
- `inspect` - puts bot-info into string and returns it