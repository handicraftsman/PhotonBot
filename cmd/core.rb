$cmds = {}
$cmdchar = "^;"

$cmdpos = 0

def onmsg(regex, &func)
  $cmds[$cmdpos] = [
    Regexp.new(regex), #0
    func               #1
  ]
  RG::Log.write "CMD> " + $cmds[$cmdpos].inspect
  $cmdpos += 1
end

def oncmd(regex, &func)
  regex = Regexp.new(/#{$cmdchar}/.to_s + regex.to_s + "\\s*" + "\r")
  onmsg(regex, &func)
end

def onctcp(regex, &func)
  regex = Regexp.new("\x01" + regex.to_s + /.*/.to_s + "\x01")
  onmsg(regex, &func)
end

class ::String
  def squish
    self.gsub(/\s+/, " ").strip
  end
end

def reload
  $cmds = {}
  $cmdpos = 0
  $cmd_help = Hash.new
  loader
end