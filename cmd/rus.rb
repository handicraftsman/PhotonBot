$rus_throwtargets = [
  "руку",
  "ногу",
  "глаз",
  "нос",
  "рот",
  "пятую точку",
  "пах",
  "голову (headshot!)",
  "промахнулся"
]

$rus_throwtargets.map! do |i|
  if i == "промахнулся"
    "промахнулся"
  else
    "попал в #{i}"
  end
end

CmdHelp.new "rus", "пнутьбалду", "пнутьбалду [цель]", "Пинает балду"
oncmd(/пнутьбалду/, 30) do |m, data|
  m.bot.a_action m.sendto, "пнул #{m.nick}. Ибо балда."
end
oncmd(/пнутьбалду (.+)/, 30) do |m, data|
  m.bot.a_action m.sendto, "пнул #{data[1].squish}. Ибо балда."
end

CmdHelp.new "rus", "грызть", "грызть [цель]", "Грызёт цель"
oncmd(/грызть/, 30) do |m, data|
  m.bot.a_action m.sendto, "грызёт #{m.nick}..."
end
oncmd(/грызть (.+)/, 30) do |m, data|
  m.bot.a_action m.sendto, "грызёт #{data[1].squish}..."
end

$ru_chewtaste = [
  "Очень вкусно.",
  "Не особо...",
  "На вкус как Г =\\",
  "На вкус как сыр Грюйер"
]
CmdHelp.new "rus", "пожевать", "пожевать [цель]", "Жуёт цель"
oncmd(/грызть/, 30) do |m, data|
  m.bot.a_action m.sendto, "немного пожевал #{m.nick}. #{$ru_chewtaste.sample}"
end
oncmd(/пожевать (.+)/, 30) do |m, data|
  m.bot.a_action m.sendto, "немного пожевал #{data[1].squish}. #{$ru_chewtaste.sample}"
end