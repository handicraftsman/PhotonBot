CmdHelp.new "admin", "rb", "rb <code>", "Executes given Ruby-code (lvl11)"
oncmd(/rb (.+?)/, 0, 11) do |m, data|
  m.nreply "Output: #{eval(data[1]).inspect}"
end