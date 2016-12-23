require "./cmd/loader.rb"

module App
  module Reactor
    class Privmsg
      attr_reader :bot, :sender_raw, :target, :message, :nick, :user, :host, :sendto

      def ctcp_encase(msg)
        /\x01#{msg}\x01/
      end

      def initialize(bot, sender, target, message)
        @bot = bot
        @sender_raw = sender
        @target = target
        @message = message

        # PhotonBot!~ruibot@localhost.localdomain
        data = /(.+)!(.+)@(.+)/.match(@sender_raw)
        @nick = data[1]
        @user = data[2]
        @host = data[3]

        @sendto = if "&#+!".include? @target[0]
                    @target
                  else
                    @nick
                  end

        if "&#+!".include? @target[0]
        else
        end

        $cmds.each do |x|
          if data = x[1][0].match(@message) 
            RG::Log.write "Starting #{x[1][1].inspect}"
            x[1][1].call(self, data)
            RG::Log.write "Finished #{x[1][1].inspect}"
            break
          end
        end

      end

      def reply(msg)
        bot.write "PRIVMSG #{@sendto} :#{msg}"
      end
    end
  end
end