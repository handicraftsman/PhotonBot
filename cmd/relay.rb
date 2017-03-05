CmdHelp.new "relay", "relay", "relay <chan1> <chan2>", "Sets up a relay between chan1 and chan2. Syntax - server!chan (lvl10)"
oncmd(/relay (.+?) (.+?)/, 0, 10) do |m, data|
  if (data[1].squish[/.*!.*/] == nil) or (data[2].squish[/.*!.*/] == nil)
    fail StandardError, "Both points must be set!"
  else
    $relaypoints = [data[1].squish, data[2].squish]
    $relayenabled = true
    m.nreply "Done!"
  end
end

CmdHelp.new "relay", "getrelay", "getrelay", "Shows info about current relay"
oncmd(/getrelay/) do |m, data|
  m.nreply "Relay: #{$relayenabled} | #{$relaypoints[0]} | #{$relaypoints[1]} "
end

CmdHelp.new "relay", "stoprelay", "stoprelay", "Stops relay (lvl10)"
oncmd(/stoprelay/, 0, 10) do |m, data|
  $relaypoints = ["", ""]
  $relayenabled = false
  m.nreply "Done!"
end
