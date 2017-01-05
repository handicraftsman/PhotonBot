$cmds = Array.new
$cmdchar = "^;"
$cmdpos = 0
$delays = Hash.new
$nodelaylvl = 8

def getsecs()
  x = DateTime.now
  ((x.hour*60) + x.min)*60 + x.sec
end

class IRCCommand
  attr_reader :regex, :delay, :lastused, :perm, :func

  def initialize(regex, delay, perm, &func)
    @regex    = regex # 0
    @delay    = delay # 2
    @perm     = perm  # 3
    @func     = func  # 1
    @lastused = Hash.new
  end

  def run(m, data)
    @func.call(m, data)
  end

  def inspect
    %{<IRCCommand:id#{self.object_id} @regex="#{@regex.inspect} @delay=#{@delay} @perm=#{@perm} @func="#{@func.inspect}">}
  end
end

def onmsg(regex, delay=0, perm=0, &func)
  cmd = IRCCommand.new(Regexp.new(regex), delay, perm, &func)
  $cmds << cmd
  RG::Log.write cmd.inspect
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
  $cmds = Array.new
  $cmd_help = Hash.new
  $delays = Hash.new
  loader
end
