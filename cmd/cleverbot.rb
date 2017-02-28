# HTTP.post("http://localhost:5000/", {:form => {:msg => "Moo"}})
CmdHelp.new("cleverbot", "cbt", "cbt", "Trigs cleverbot (lvl8)")
$cbstate = false
$cbaddr = "http://localhost:8082/"

oncmd(/cbt/, 0, 8) do |m, data|
  $cbstate = !$cbstate
  m.nreply "Changed cleverbot-client's state to #{$cbstate}"
end

CmdHelp.new("cleverbot", "cb", "cb", "Chat with cleverbot")
oncmd(/cb (.+)/) do |m, data|
  if $cbstate
    x = HTTP.post($cbaddr, {:form => {:msg => data[1].squish, :nick => m.nick}})
    m.reply "#{m.nick}: #{x.body.to_s}"
  end
end