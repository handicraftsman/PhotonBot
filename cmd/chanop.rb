# OP
CmdHelp.new "chanop", "op", "op [chan] <user>", "Ops target (lvl6)"
oncmd(/op (.+?) (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 6
    m.bot.a_op(data[1], data[2])
    m.reply "Sent!"
  else
    fail CMDNoPermError, $err_noperms
  end  
end

oncmd(/op (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 6
    m.bot.a_op(m.target, data[1])
    m.reply "Sent!"
  else
    fail CMDNoPermError, $err_noperms
  end  
end

CmdHelp.new "chanop", "cop", "cop <server> <chan> <user>", "Cross-server counterpart of `op` (lvl9)"
oncmd(/cop (.+?) (.+?) (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 9
    App.bots[data[1]].a_op(data[2], data[3])
    m.reply "Sent!"
  else
    fail CMDNoPermError, $err_noperms
  end  
end

CmdHelp.new "chanop", "deop", "deop [chan] <user>", "Deops target (lvl6)"
oncmd(/deop (.+?) (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 6
    m.bot.a_deop(data[1], data[2])
    m.reply "Sent!"
  else
    fail CMDNoPermError, $err_noperms
  end  
end

oncmd(/deop (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 6
    m.bot.a_deop(m.target, data[1])
    m.reply "Sent!"
  else
    fail CMDNoPermError, $err_noperms
  end  
end

CmdHelp.new "chanop", "cdeop", "cdeop <server> <chan> <user>", "Cross-server counterpart of `deop` (lvl9)"
oncmd(/cdeop (.+?) (.+?) (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 9
    App.bots[data[1]].a_op(data[2], data[3])
    m.reply "Sent!"
  else
    fail CMDNoPermError, $err_noperms
  end  
end




# HALF OP
CmdHelp.new "chanop", "hop", "hop [chan] <user>", "half-ops target (lvl6)"
oncmd(/hop (.+?) (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 6
    m.bot.a_hop(data[1], data[2])
    m.reply "Sent!"
  else
    fail CMDNhopermError, $err_nhoperms
  end  
end

oncmd(/hop (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 6
    m.bot.a_hop(m.target, data[1])
    m.reply "Sent!"
  else
    fail CMDNhopermError, $err_nhoperms
  end  
end

CmdHelp.new "chanop", "chop", "chop <server> <chan> <user>", "Cross-server counterpart of `hop` (lvl9)"
oncmd(/chop (.+?) (.+?) (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 9
    App.bots[data[1]].a_hop(data[2], data[3])
    m.reply "Sent!"
  else
    fail CMDNhopermError, $err_nhoperms
  end  
end

CmdHelp.new "chanop", "dehop", "dehop [chan] <user>", "Un-half-ops target (lvl6)"
oncmd(/dehop (.+?) (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 6
    m.bot.a_dehop(data[1], data[2])
    m.reply "Sent!"
  else
    fail CMDNhopermError, $err_nhoperms
  end  
end

oncmd(/dehop (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 6
    m.bot.a_dehop(m.target, data[1])
    m.reply "Sent!"
  else
    fail CMDNhopermError, $err_nhoperms
  end  
end

CmdHelp.new "chanop", "cdehop", "cdehop <server> <chan> <user>", "Cross-server counterpart of `dehop` (lvl9)"
oncmd(/cdehop (.+?) (.+?) (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 9
    App.bots[data[1]].a_hop(data[2], data[3])
    m.reply "Sent!"
  else
    fail CMDNhopermError, $err_nhoperms
  end  
end




# VOICE
CmdHelp.new "chanop", "voice", "voice [chan] <user>", "Voices target (lvl6)"
oncmd(/voice (.+?) (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 6
    m.bot.a_voice(data[1], data[2])
    m.reply "Sent!"
  else
    fail CMDNvoiceermError, $err_nvoiceerms
  end  
end

oncmd(/voice (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 6
    m.bot.a_voice(m.target, data[1])
    m.reply "Sent!"
  else
    fail CMDNvoiceermError, $err_nvoiceerms
  end  
end

CmdHelp.new "chanop", "cvoice", "cvoice <server> <chan> <user>", "Cross-server counterpart of `voice` (lvl9)"
oncmd(/cvoice (.+?) (.+?) (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 9
    App.bots[data[1]].a_voice(data[2], data[3])
    m.reply "Sent!"
  else
    fail CMDNvoiceermError, $err_nvoiceerms
  end  
end

CmdHelp.new "chanop", "devoice", "devoice <chan> <user>", "Devoices target (lvl6)"
oncmd(/devoice (.+?) (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 6
    m.bot.a_devoice(data[1], data[2])
    m.reply "Sent!"
  else
    fail CMDNvoiceermError, $err_nvoiceerms
  end  
end

oncmd(/devoice (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 6
    m.bot.a_devoice(m.target, data[1])
    m.reply "Sent!"
  else
    fail CMDNvoiceermError, $err_nvoiceerms
  end  
end

CmdHelp.new "chanop", "cdevoice", "cdevoice <server> <chan> <user>", "Cross-server counterpart of `devoice` (lvl9)"
oncmd(/cdevoice (.+?) (.+?) (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 9
    App.bots[data[1]].a_voice(data[2], data[3])
    m.reply "Sent!"
  else
    fail CMDNvoiceermError, $err_nvoiceerms
  end  
end




# BAN
CmdHelp.new "chanop", "ban", "ban [chan] <user>", "Bans target (lvl6)"
oncmd(/ban (.+?) (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 6
    m.bot.a_ban(data[1], data[2])
    m.reply "Sent!"
  else
    fail CMDNbanermError, $err_nbanerms
  end  
end

oncmd(/ban (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 6
    m.bot.a_ban(m.target, data[1])
    m.reply "Sent!"
  else
    fail CMDNbanermError, $err_nbanerms
  end  
end

CmdHelp.new "chanop", "cban", "cban <server> <chan> <user>", "Cross-server counterpart of `ban` (lvl9)"
oncmd(/cban (.+?) (.+?) (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 9
    App.bots[data[1]].a_ban(data[2], data[3])
    m.reply "Sent!"
  else
    fail CMDNbanermError, $err_nbanerms
  end  
end

CmdHelp.new "chanop", "unban", "unban <chan> <user>", "Unbans target (lvl6)"
oncmd(/unban (.+?) (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 6
    m.bot.a_unban(data[1], data[2])
    m.reply "Sent!"
  else
    fail CMDNbanermError, $err_nbanerms
  end  
end

oncmd(/unban (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 6
    m.bot.a_unban(m.target, data[1])
    m.reply "Sent!"
  else
    fail CMDNbanermError, $err_nbanerms
  end  
end

CmdHelp.new "chanop", "cunban", "cunban <server> <chan> <user>", "Cross-server counterpart of `unban` (lvl9)"
oncmd(/cunban (.+?) (.+?) (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 9
    App.bots[data[1]].a_ban(data[2], data[3])
    m.reply "Sent!"
  else
    fail CMDNbanermError, $err_nbanerms
  end  
end




# EXEMPT
CmdHelp.new "chanop", "exempt", "exempt [chan] <user>", "Exempts target (lvl6)"
oncmd(/exempt (.+?) (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 6
    m.bot.a_exempt(data[1], data[2])
    m.reply "Sent!"
  else
    fail CMDNexemptermError, $err_nexempterms
  end  
end

oncmd(/exempt (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 6
    m.bot.a_exempt(m.target, data[1])
    m.reply "Sent!"
  else
    fail CMDNexemptermError, $err_nexempterms
  end  
end

CmdHelp.new "chanop", "cexempt", "cexempt <server> <chan> <user>", "Cross-server counterpart of `exempt` (lvl9)"
oncmd(/cexempt (.+?) (.+?) (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 9
    App.bots[data[1]].a_exempt(data[2], data[3])
    m.reply "Sent!"
  else
    fail CMDNexemptermError, $err_nexempterms
  end  
end

CmdHelp.new "chanop", "unexempt", "unexempt <chan> <user>", "Unexempts target (lvl6)"
oncmd(/unexempt (.+?) (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 6
    m.bot.a_unexempt(data[1], data[2])
    m.reply "Sent!"
  else
    fail CMDNexemptermError, $err_nexempterms
  end  
end

oncmd(/unexempt (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 6
    m.bot.a_unexempt(m.target, data[1])
    m.reply "Sent!"
  else
    fail CMDNexemptermError, $err_nexempterms
  end  
end

CmdHelp.new "chanop", "cunexempt", "cunexempt <server> <chan> <user>", "Cross-server counterpart of `unexempt` (lvl9)"
oncmd(/cunexempt (.+?) (.+?) (.+)/) do |m, data|
  if db_getperm(m.bot, m.host) >= 9
    App.bots[data[1]].a_exempt(data[2], data[3])
    m.reply "Sent!"
  else
    fail CMDNexemptermError, $err_nexempterms
  end  
end