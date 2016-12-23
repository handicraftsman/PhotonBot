$dbs = Hash.new

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