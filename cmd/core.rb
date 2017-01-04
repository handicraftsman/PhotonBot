$cmds = {}
$cmdchar = "^;"
$cmdpos = 0
$delays = Hash.new
$nodelaylvl = 8

def getsecs()
  x = DateTime.now
  ((x.hour*60) + x.min)*60 + x.sec
end

def onmsg(regex, delay=0, perm=0, &func)
  $cmds[$cmdpos] = [
    Regexp.new(regex), #0
    func,              #1
    delay,             #2
    perm,              #3
  ]
  RG::Log.write "CMD> " + $cmds[$cmdpos].inspect
  $cmdpos += 1
end

def oncmd(regex, delay=0, perm=0, &func)
  regex = Regexp.new(/#{$cmdchar}/.to_s + regex.to_s + "\\s*" + "\r")
  onmsg(regex, delay, perm, &func)
end

def onctcp(regex, delay=0, perm=0, &func)
  regex = Regexp.new("\x01" + regex.to_s + /.*/.to_s + "\x01")
  onmsg(regex, delay, perm, &func)
end

def reload
  $cmds = {}
  $cmdpos = 0
  $cmd_help = Hash.new
  $delays = Hash.new
  loader
end
