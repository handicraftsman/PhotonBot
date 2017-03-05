$cmd_help = Hash.new

class HelpError < StandardError
end

class CmdHelp
  attr_reader :part, :command, :syntax, :description

  def initialize(part, command, syntax, description)
    @part        = part
    @command     = command
    @syntax      = syntax
    @description = description

    unless $cmd_help[@part]
      $cmd_help[@part] = Array.new
    end
    $cmd_help[@part] << self
  end
end

def render_help_cmd(query)
  str = ""
  $cmd_help.each do |part, cmdarr|
    cmdarr.each do |cmd|
      if cmd.command == query
        str = "%BPart:%N #{cmd.part} %B| Name:%N #{cmd.command} %B| Syntax:%N #{cmd.syntax} %B| Description:%N #{cmd.description}"
      end
    end
  end
  if str == ""
    fail HelpError, "No such help-entry"
  end
  return str
end

def render_help_list(query)
  str = ""
  if query == ";"
    str = "%BParts:%N "
    $cmd_help.each do |part, _|
      str << "#{part} "
    end
    return str
  else
    unless $cmd_help[query]
      fail HelpError, "No such part"
    end
    str = "%BCommands in `#{query}`:%N "
    $cmd_help[query].each do |cmd|
      str << cmd.command + " "
    end
    return str
  end
end

CmdHelp.new "help", "help", "help [cmd]", "Displays help for given command"
oncmd(/help (.+)/) do |m, data|
  query = data[1]
  m.nreply render_help_cmd(query)
end
oncmd(/help/) do |m, data|
  m.nreply "Use %Blist%N command to list all parts. %Blist <part>%N " +
    "to list all commands in the given part. Use %Bhelp <cmd>%N to get info about given command"
end

CmdHelp.new "help", "list", "list [part]", "Displays part list. If part given - displays command list in that part"
oncmd(/list (.+)/) do |m, data|
  query = data[1]
  m.nreply render_help_list(query)
end
oncmd(/list/) do |m, data|
  m.nreply render_help_list(";")
end