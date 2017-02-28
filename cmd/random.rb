CmdHelp.new "random", "ping", "ping", "Ping!"
oncmd(/ping/, 5) do |m, data|
  m.reply "pong"
end
oncmd(/ping (.+)/, 5) do |m, data|
  m.reply "pong #{data[1]}"
end

$attackmessages = [
  "smashes his staff into [[nick]] while shooting a fireball in his direction",
  "shoots digital missile in [[nick]]'s direction",
  "shoots analog missile in [[nick]]'s direction",
  "segfaults [[nick]]",
  "kernel panics [[nick]]",
  "pushes [[nick]] into the void",
  "halts [[nick]]",
  "makes [[nick]] write an IRC bot in brainf*ck",
  "drops [[nick]] into an acid lake",
  "pours lava bucket onto [[nick]]",
  "simply kills [[nick]]",
  "backstabs [[nick]]",
  "0011011000110[[nick]]110011100110",
  "mass-highlights [[nick]]",
  "pushes [[nick]] into white noise",
  "teleports wheeping angel in back of [[nick]]"
]
CmdHelp.new "random", "attack", "attack <target>", "Attacks target"
oncmd(/attack (.+)/, 30) do |m, data|
  m.bot.a_action m.sendto, $attackmessages.sample.gsub("[[nick]]", data[1].squish)
end

CmdHelp.new "random", "cookie", "cookie [target]", "Gives a cookie to the target (lvl5)"
oncmd(/cookie (.+)/, 10, 0) do |m, data|
  m.bot.a_action m.sendto, "gives a cookie to #{data[1].squish}" 
end
oncmd(/cookie/, 10, 0) do |m, data|
  m.reply "* #{m.nick} eats a cookie"
end