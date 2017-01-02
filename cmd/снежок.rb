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