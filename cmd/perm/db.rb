class DBError < StandardError
end

def db_new(bot)
  exists = File.exist? "db/#{bot.name}.db"
  $dbs[bot.name] = SQLite3::Database.new "db/#{bot.name}.db"
  db = $dbs[bot.name]
  unless exists
    db.execute <<-SQL
      create table perms (
        host varchar(64),
        lvl  int
      );
    SQL
    db.execute <<-SQL
      create table calcs (
        name varchar(64),
        text varchar(4096)
      );
    SQL
    db.execute <<-SQL
      create table ignores ( 
        regex varchar(64) 
      );
    SQL
    db.execute <<-SQL
      create table badwords (
        regex varchar(64) 
      );
    SQL
    db.execute <<-SQL
      create table extra ( 
        key varchar(64), 
        value varchar(64)
      );
    SQL
    
    if bot.autoowner != nil
      db.execute %{insert into perms (host, lvl) values (\"#{bot.autoowner}\", 11);}
    end
  end
end

def db_getperm(bot, host)
  unless host == bot.autoowner
    db = $dbs[bot.name]
    rows = db.execute <<-SQL
      select * from perms where host="#{host}";
    SQL
    if rows == []
      return 1
    end
  return rows[0][1]
  else
    return 11
  end
end

def db_setperm(bot, host, lvl)
  db = $dbs[bot.name]
  rows = db.execute <<-SQL
    select * from perms where host="#{host}";
  SQL
  if rows == []
    db.execute %{insert into perms (host, lvl) values ("#{host}", #{lvl});}
  else
    db.execute %{update perms set lvl = #{lvl} where host = "#{host}";}
  end
end

def db_addignore(bot, data)
  db = $dbs[bot.name]
  unless db_ignored?(bot, data)
    db.execute %{insert into ignores (regex) values ("#{data}")}
  end
end

def db_ignored?(bot, data)
  db = $dbs[bot.name]
  rows = db.execute %{select * from ignores}
  rows.each do |row|
    regex = row[0].gsub(".", "\\.").gsub("*", ".*")
    if Regexp.new(regex).match(data)
      return true
    end
  end
  return false
end

def db_delignore(bot, data)
  db = $dbs[bot.name]
  if db_ignored?(bot, data)
    db.execute %{delete from ignores where regex="#{data}"}
  end
end