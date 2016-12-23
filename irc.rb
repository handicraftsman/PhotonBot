require "./cmd/perm/db.rb"

module App
  class Bot
    attr_reader :name, :user, :nick, :rname, :pass, :use_pass, :host, :port, :autojoin, :autoowner

    def initialize(conf)
      # conf[0] - server-name
      # conf[1] - server-config
      @name = conf[0]
      @user = conf[1]["user"]
      @nick = conf[1]["nick"]
      @rname = conf[1]["rname"]
      @use_pass = conf[1]["use_pass"]
      if @use_pass
        @pass = conf[1]["pass"]
      end
      @host = conf[1]["host"]
      @port = conf[1]["port"]
      @autojoin = conf[1]["autojoin"]
      @autoowner = conf[1]["autoowner"]

      RG::Log.write self.inspect
      RG::Log.write "DB-init: " + @name
      db_new(self)
    end

    def start!
      @sock = TCPSocket.new @host, @port
      if @use_pass
        self.write "PASS #{@pass}"
      end
      self.write "USER #{@user} 0 * :#{@rname}"
      self.write "NICK #{@nick}"
      
      while line = @sock.gets
        # Write message
        RG::Log.write "#{@name}:< #{line}"
        
        if line[/^PING :(.+)/]
          # Reply to ping
          self.write "PONG :#{$1}"
        elsif line[/^:(.+) 001/]
        # Autojoin when 001
          @autojoin.each do |x|
            self.write "JOIN #{x}"
          end
        elsif data = /^:(.+) PRIVMSG (.+) :(.+)/.match(line)
          sender = data[1]
          target = data[2]
          message = data[3]
          # PRIVMSG-parser
          Thread.new do
            begin
              Reactor::Privmsg.new(self, sender, target, message)
            rescue StandardError => e
              RG::Log.err e.inspect
              self.write "PRIVMSG #{target} :err: #{e.inspect}" 
            end
          end
        end
      end
    end

    def self.getCodeRegex(code)
      
    end

    #def reader(line)
    #end

    def write(msg)
      RG::Log.write "#{@name}:> #{msg}"
      @sock.puts msg
    end

    def inspect
      %{<App::Bot:id#{self.object_id} `#{@name}` @host=#{@host} @port=#{@port} @user=#{@user} @nick=#{@nick}>}
    end
  end
end