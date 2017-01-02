CmdHelp.new "rus", "снежок", "снежок <цель>", "Швыряет снежок в цель"
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

oncmd(/снежок (.+)/) do |m, data|  
  if data[1].squish == "всех"
    target = "во всех"
  else
    target = "в " + data[1].squish
  end
  y = [$rus_throwtargets.sample, "промахнулся"].sample
  m.bot.a_action m.sendto, "кинул снежком #{target} и #{y}."
end

oncmd(/снежкотлета (.+)/) do |m, data|
  if data[1].squish == "всех"
    target = "во всех"
  else
    target = "в " + data[1].squish
  end
  y = [$rus_throwtargets.sample, "промахнулся"].sample
  m.bot.a_action m.sendto, "взял снежок и котлету, смял в единое целое, кинул #{target} и #{y}."
end