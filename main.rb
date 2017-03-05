$running = false

load "./conf.rb"
load "./irc.rb"
  load "./irc_color.rb"
  load "./irc_privmsg.rb"
  load "./irc_actions.rb"

module App
  def self.bots
    @bots
  end

  def self.start!
    RG::Log.write "PhotonBot: Starting..."
    $dbs = Hash.new
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