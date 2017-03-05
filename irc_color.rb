class String
  def colorize
    x = self
    x
      .gsub("%C%",     "%C?")
      .gsub(",%",      ",?")
      .gsub("%C",      "\x03")
      .gsub("%B",      "\x02")
      .gsub("%I",      "\x10")
      .gsub("%U",      "\x1F")
      .gsub("%N",      "\x0F")
      .gsub("?WHITE",  "0")
      .gsub("?BLACK",  "1")
      .gsub("?BLUE",   "2")
      .gsub("?GREEN",  "3")
      .gsub("?RED",   "4")
      .gsub("?BROWN",  "5")
      .gsub("?PURPLE", "6")
      .gsub("?ORANGE", "7")
      .gsub("?YELLOW", "8")
      .gsub("?LGREEN", "9")
      .gsub("?CYAN"  , "10")
      .gsub("?LCYAN",  "11")
      .gsub("?LBLUE",  "12")
      .gsub("?PINK",   "13")
      .gsub("?GREY",   "14")
      .gsub("?LGREY",  "15")
  end
end