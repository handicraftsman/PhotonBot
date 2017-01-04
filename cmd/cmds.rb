# Load all your modules here

load "cmd/help.rb"

load "cmd/perm.rb"
load "cmd/eval.rb"
load "cmd/joinpart.rb"
load "cmd/msg.rb"

load "cmd/ping.rb"
load "cmd/calc.rb"

load "cmd/utils.rb"
load "cmd/chanop.rb"
load "cmd/ignores.rb"

# Rus
load "cmd/rus.rb"

# Unknown
oncmd(/.+/) do |m, data|
  m.bot.a_notice m.nick, "Unknown command. Try ;help for help."
end