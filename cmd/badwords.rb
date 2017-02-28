$bw_databases = Hash.new
$bw_enabled = true
$bw_loaded = false
$bw_messages = Hash.new

def bw_load
  $bw_databases = Hash.new
  $bw_messages = Hash.new
  $dbs.each do |k, db|
    $bw_databases[k] = Array.new
    rows = db.execute <<-SQL
      select * from badwords;
    SQL
    rows.each do |r|
      $bw_databases[k] << Regexp.new("(:?^| )" + r[0].gsub("*", ".*"), 1)
    end

    rows = db.execute <<-SQL
      select value from extra where key="bw_message";
    SQL
    if rows == []
      db.execute <<-SQL
        insert into extra ( key, value ) values ("bw_message", "[[nick]], do not use profanity here!")
      SQL
      rows = db.execute <<-SQL
        select value from extra where key="bw_message";
      SQL
    end
    $bw_messages[k] = rows[0][0]
  end
  $bw_enabled = true
  $bw_loaded = true
end

CmdHelp.new("admin", "addbw", "addbw <regex>", "Adds given bad-word scanning regex")
oncmd(/addbw (.+)/, 0, 9) do |m, data|
  $bw_databases[m.bot.name].execute <<-SQL
    insert into badwords ( regex ) values ("#{data[1].antiinject}");
  SQL
end

CmdHelp.new("admin", "delbw", "delbw <regex>", "Deletes given bad-word scanning regex")
oncmd(/delbw (.+)/, 0, 9) do |m, data|
  $bw_databases[m.bot.name].execute <<-SQL
    delete from badwords where regex="#{data[1].antiinject}";
  SQL
end