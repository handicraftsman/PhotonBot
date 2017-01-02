$rus_throwtargets = [
  "руку",
  "ногу",
  "глаз",
  "нос",
  "рот",
  "пятую точку",
  "пах",
  "голову (headshot!)",
]

$rus_throwtargets.map! do |i|
  "попал в #{i}"
end

CmdHelp.new "rus", "снежок", "снежок <цель>", "Швыряет снежок в цель"
oncmd(/снежок (.+)/) do |m, data|  
  if data[1].squish == "всех"
    target = "во всех"
  else
    target = "в " + data[1].squish
  end
  y = [$rus_throwtargets.sample, "промахнулся"].sample
  m.bot.a_action m.sendto, "кинул снежком #{target} и #{y}."
end

CmdHelp.new "rus", "снежкотлета", "снежкотлета <цель>", "Швыряет снежкотлету в цель"
oncmd(/снежкотлета (.+)/) do |m, data|
  if data[1].squish == "всех"
    target = "во всех"
  else
    target = "в " + data[1].squish
  end
  y = [$rus_throwtargets.sample, "промахнулся"].sample
  m.bot.a_action m.sendto, "взял снежок и котлету, смял в единое целое, кинул #{target} и #{y}."
end

CmdHelp.new "rus", "пнутьбалду", "пнутьбалду [цель]", "Пинает балду"
oncmd(/пнутьбалду/) do |m, data|
  m.bot.a_action m.sendto, "пнул #{m.nick}. Ибо балда."
end
oncmd(/пнутьбалду (.+)/) do |m, data|
  m.bot.a_action m.sendto, "пнул #{data[1].squish}. Ибо балда."
end

CmdHelp.new "rus", "грызть", "грызть [цель]", "Грызёт цель"
oncmd(/грызть/) do |m, data|
  m.bot.a_action m.sendto, "грызёт #{m.nick}..."
end
oncmd(/грызть (.+)/) do |m, data|
  m.bot.a_action m.sendto, "грызёт #{data[1].squish}..."
end

$ru_chewtaste = [
  "Очень вкусно.",
  "Не особо...",
  "На вкус как Г =\\"
]
CmdHelp.new "rus", "пожевать", "пожевать [цель]", "Жуёт цель"
oncmd(/грызть/) do |m, data|
  m.bot.a_action m.sendto, "немного пожевал #{m.nick}. #{$ru_chewtaste.sample}"
end
oncmd(/пожевать (.+)/) do |m, data|
  m.bot.a_action m.sendto, "немного пожевал #{data[1].squish}. #{$ru_chewtaste.sample}"
end