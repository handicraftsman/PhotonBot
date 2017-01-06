load "./cmd/perm/db.rb"

module App
  class Bot
    attr_reader :name, :user, :nick, :rname, :pass, :use_pass, :host, :port, :autojoin, :autoowner, :queue

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

      RG::Log.write "Bot> " + self.inspect
      RG::Log.write "DB-init> " + @name
      db_new(self)
    end

    def start!
      @sock = TCPSocket.new @host, @port
      if @use_pass
        self.raw_write "PASS #{@pass}"
      end
      self.raw_write "USER #{@user} 0 * :#{@rname}"
      self.raw_write "NICK #{@nick}"
      
      Thread.new { self.thr_writer! }
      while line = @sock.gets.force_encoding("UTF-8")
        # Write message
        RG::Log.write "#{@name}:< #{line}"
        
        if line[/^PING :(.+)/]
          # Reply to ping
          self.raw_write "PONG :#{$1}"
        elsif line[/^:(.+) 001/]
        # Autojoin when 001
          @autojoin.each do |x|
            self.raw_write "JOIN #{x}"
          end
        elsif data = /^:(.+?) PRIVMSG (.+?) :(.+)/.match(line)
          sender = data[1]
          target = data[2]
          message = data[3]
          # PRIVMSG-parser
          Thread.new do
            begin
              Reactor::Privmsg.new(self, sender, target, message)
            rescue StandardError => e
              RG::Log.err e.inspect
              self.a_notice(/(.*)!.*@.*/.match(sender)[1], "err: #{e.inspect}".delete("\n")) 
            end
          end
        end
      end
    end

    def thr_writer!
      @queue = Queue.new
      loop do
        self.raw_write @queue.pop
        sleep 0.7
      end
      sleep 0.1
    end

    def raw_write(msg)
      @sock.puts msg.encode("UTF-8", msg.encoding)
    end

    def write(msg)
      if @queue == nil
        @queue = Array.new
      end
      RG::Log.write "#{@name}:> #{msg.encode('UTF-8', msg.encoding)}"
      @queue << msg
    end

    def inspect
      %{<App::Bot:0x#{self.object_id.to_s(16)} `#{@name}` @host=#{@host} @port=#{@port} @user=#{@user} @nick=#{@nick}>}
    end
  end
end