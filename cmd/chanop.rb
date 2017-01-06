# OP
CmdHelp.new "chanop", "op", "op [chan] <user>", "Ops target (lvl6)"
oncmd(/op (.+?) (.+)/, 0, 6) do |m, data|
  m.bot.a_op(data[1], data[2])
  m.nreply "Sent!" 
end

oncmd(/op (.+)/, 0, 6) do |m, data|
  m.bot.a_op(m.target, data[1])
  m.nreply "Sent!"
end

CmdHelp.new "chanop", "cop", "cop <server> <chan> <user>", "Cross-server counterpart of `op` (lvl9)"
oncmd(/cop (.+?) (.+?) (.+)/, 0, 9) do |m, data|
  App.bots[data[1]].a_op(data[2], data[3])
  m.rneply "Sent!"
end

CmdHelp.new "chanop", "deop", "deop [chan] <user>", "Deops target (lvl6)"
oncmd(/deop (.+?) (.+)/, 0, 6) do |m, data|
  m.bot.a_deop(data[1], data[2])
  m.nreply "Sent!"
end

oncmd(/deop (.+)/, 0, 6) do |m, data|
  m.bot.a_deop(m.target, data[1])
  m.nreply "Sent!"
end

CmdHelp.new "chanop", "cdeop", "cdeop <server> <chan> <user>", "Cross-server counterpart of `deop` (lvl9)"
oncmd(/cdeop (.+?) (.+?) (.+)/, 0, 9) do |m, data|
  App.bots[data[1]].a_op(data[2], data[3])
  m.nreply "Sent!"
end




# HALF OP
CmdHelp.new "chanop", "hop", "hop [chan] <user>", "half-ops target (lvl6)"
oncmd(/hop (.+?) (.+)/, 0, 6) do |m, data|
  m.bot.a_hop(data[1], data[2])
  m.nreply "Sent!"
end

oncmd(/hop (.+)/, 0, 6) do |m, data|
  m.bot.a_hop(m.target, data[1])
  m.nreply "Sent!"
end

CmdHelp.new "chanop", "chop", "chop <server> <chan> <user>", "Cross-server counterpart of `hop` (lvl9)"
oncmd(/chop (.+?) (.+?) (.+)/, 0, 9) do |m, data|
  App.bots[data[1]].a_hop(data[2], data[3])
  m.nreply "Sent!"  
end

CmdHelp.new "chanop", "dehop", "dehop [chan] <user>", "Un-half-ops target (lvl6)"
oncmd(/dehop (.+?) (.+)/, 0, 6) do |m, data|
    m.bot.a_dehop(data[1], data[2])
    m.nreply "Sent!"
end

oncmd(/dehop (.+)/, 0, 6) do |m, data|
  m.bot.a_dehop(m.target, data[1])
  m.nreply "Sent!"
end

CmdHelp.new "chanop", "cdehop", "cdehop <server> <chan> <user>", "Cross-server counterpart of `dehop` (lvl9)"
oncmd(/cdehop (.+?) (.+?) (.+)/, 0, 9) do |m, data|
  App.bots[data[1]].a_hop(data[2], data[3])
  m.nreply "Sent!"
end




# VOICE
CmdHelp.new "chanop", "voice", "voice [chan] <user>", "Voices target (lvl6)"
oncmd(/voice (.+?) (.+)/, 0, 6) do |m, data|
  m.bot.a_voice(data[1], data[2])
  m.nreply "Sent!"
end

oncmd(/voice (.+)/, 0, 6) do |m, data|
  m.bot.a_voice(m.target, data[1])
  m.nreply "Sent!" 
end

CmdHelp.new "chanop", "cvoice", "cvoice <server> <chan> <user>", "Cross-server counterpart of `voice` (lvl9)"
oncmd(/cvoice (.+?) (.+?) (.+)/, 0, 9) do |m, data|
  App.bots[data[1]].a_voice(data[2], data[3])
  m.nreply "Sent!"
end

CmdHelp.new "chanop", "devoice", "devoice <chan> <user>", "Devoices target (lvl6)"
oncmd(/devoice (.+?) (.+)/, 0, 6) do |m, data|
  m.bot.a_devoice(data[1], data[2])
  m.nreply "Sent!"
end

oncmd(/devoice (.+)/, 0, 6) do |m, data|
  m.bot.a_devoice(m.target, data[1])
  m.nreply "Sent!"
end

CmdHelp.new "chanop", "cdevoice", "cdevoice <server> <chan> <user>", "Cross-server counterpart of `devoice` (lvl9)"
oncmd(/cdevoice (.+?) (.+?) (.+)/, 0, 9) do |m, data|
  App.bots[data[1]].a_voice(data[2], data[3])
  m.nreply "Sent!" 
end




# BAN
CmdHelp.new "chanop", "ban", "ban [chan] <user>", "Bans target (lvl6)"
oncmd(/ban (.+?) (.+)/, 0, 6) do |m, data|
  m.bot.a_ban(data[1], data[2])
  m.nreply "Sent!"
end

oncmd(/ban (.+)/, 0, 6) do |m, data|
  m.bot.a_ban(m.target, data[1])
  m.nreply "Sent!"
end

CmdHelp.new "chanop", "cban", "cban <server> <chan> <user>", "Cross-server counterpart of `ban` (lvl9)"
oncmd(/cban (.+?) (.+?) (.+)/, 0, 9) do |m, data|
  App.bots[data[1]].a_ban(data[2], data[3])
  m.nreply "Sent!"
end

CmdHelp.new "chanop", "unban", "unban <chan> <user>", "Unbans target (lvl6)"
oncmd(/unban (.+?) (.+)/, 0, 6) do |m, data|
  m.bot.a_unban(data[1], data[2])
  m.nreply "Sent!"
end

oncmd(/unban (.+)/, 0, 6) do |m, data|
  m.bot.a_unban(m.target, data[1])
  m.nreply "Sent!"
end

CmdHelp.new "chanop", "cunban", "cunban <server> <chan> <user>", "Cross-server counterpart of `unban` (lvl9)"
oncmd(/cunban (.+?) (.+?) (.+)/, 0, 9) do |m, data|
  App.bots[data[1]].a_ban(data[2], data[3])
  m.nreply "Sent!"
end




# EXEMPT
CmdHelp.new "chanop", "exempt", "exempt [chan] <user>", "Exempts target (lvl6)"
oncmd(/exempt (.+?) (.+)/, 0, 6) do |m, data|
  m.bot.a_exempt(data[1], data[2])
  m.nreply "Sent!"
end

oncmd(/exempt (.+)/, 0, 6) do |m, data|
  m.bot.a_exempt(m.target, data[1])
  m.nreply "Sent!" 
end

CmdHelp.new "chanop", "cexempt", "cexempt <server> <chan> <user>", "Cross-server counterpart of `exempt` (lvl9)"
oncmd(/cexempt (.+?) (.+?) (.+)/, 0, 9) do |m, data|
  App.bots[data[1]].a_exempt(data[2], data[3])
  m.nreply "Sent!"
end

CmdHelp.new "chanop", "unexempt", "unexempt <chan> <user>", "Unexempts target (lvl6)"
oncmd(/unexempt (.+?) (.+)/, 0, 6) do |m, data|
  m.bot.a_unexempt(data[1], data[2])
  m.nreply "Sent!" 
end

oncmd(/unexempt (.+)/, 0, 6) do |m, data|
  m.bot.a_unexempt(m.target, data[1])
  m.nreply "Sent!"
end

CmdHelp.new "chanop", "cunexempt", "cunexempt <server> <chan> <user>", "Cross-server counterpart of `unexempt` (lvl9)"
oncmd(/cunexempt (.+?) (.+?) (.+)/, 0, 9) do |m, data|
  App.bots[data[1]].a_exempt(data[2], data[3])
  m.nreply "Sent!"
end




# KICK
CmdHelp.new "chanop", "kick", "kick [chan] <target> [:reason]", "Kicks target (lvl6)"
oncmd(/kick (.+?) :(.+)/, 0, 6) do |m, data|
  m.bot.write "KICK #{m.target} #{data[1]} :#{data[2]}"
  m.nreply "Sent!"
end
oncmd(/kick (.+?) (.+)/, 0, 6) do |m, data|
  m.bot.write "KICK #{data[1]} #{data[2]}"
  m.nreply "Sent!"
end
oncmd(/kick (.+)/, 0, 6) do |m, data|
  m.bot.write "KICK #{m.target} #{data[1]}"
  m.nreply "Sent!"
end
oncmd(/kick (.+?) (.+?) :(.+)/, 0, 6) do |m, data|
  m.bot.write "KICK #{data[1]} #{data[2]} :#{data[3]}"
  m.nreply "Sent!"
end

CmdHelp.new "chanop", "ckick", "ckick <server> <chan> <target> [:reason]", "Cross-server counterpart of `kick` (lvl9)"
oncmd(/ckick (.+?) (.+?) (.+)/, 0, 9) do |m, data|
  App.bots[data[1]].write "KICK #{data[2]} #{data[3]}"
  m.nreply "Sent!"
end
oncmd(/ckick (.+?) (.+?) (.+?) :(.+)/, 0, 9) do |m, data|
  App.bots[data[1]].write "KICK #{data[2]} #{data[3]} :#{data[4]}"
  m.nreply "Sent!"
end
