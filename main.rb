require "./conf"
require "./irc"
  require "./irc_privmsg"
  require "./irc_actions"

module App
  def self.bots
    @bots
  end

  def self.start!
    RG::Log.write "PhotonBot: Starting..."
    @conf = Conf.parse!

    @bots = {}
    @botthreads = {}
    @conf.each do |x|
      @botthreads[x[0]] = Thread.new do
        if x[1]["enabled"]
          @bots[x[0]] = Bot.new(x)
          @bots[x[0]].start!
        end
      end
    end

    @botthreads.each do |t|
      t.join
      loop do
        sleep 60
      end
    end
  end
end

RG::Log.write "Finished loading PhotonBot..."