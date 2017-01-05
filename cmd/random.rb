CmdHelp.new "random", "ping", "ping", "Ping!"
oncmd(/ping/, 5) do |m, data|
  m.reply "pong"
end
oncmd(/ping (.+)/, 5) do |m, data|
  m.reply "pong #{data[1]}"
end

# 
$attackmessages = [
  # Handi's
  "smashes his staff into [[nick]] while shooting a fireball in his direction",
  "shoots digital missile in [[nick]]'s direction",
  "shoots analog missile in [[nick]]'s direction",
  "segfaults [[nick]]",
  "kernel panics [[nick]]"
]
CmdHelp.new "random", "attack", "attack <target>", "Attacks target"
oncmd(/attack (.+)/, 30) do |m, data|
  m.bot.a_action m.sendto, $attackmessages.sample.gsub("[[nick]]", data[1].squish)
end