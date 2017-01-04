load "./cmd/loader.rb"

module App
  module Reactor
    class Privmsg
      attr_reader :bot, :sender_raw, :target, :message, :nick, :user, :host, :sendto

      def ctcp_encase(msg)
        /\x01#{msg}\x01/
      end

      def initialize(bot, sender, target, message)
        @bot = bot
        @sender_raw = sender.force_encoding("UTF-8")
        @target = target.force_encoding("UTF-8")
        @message = message.force_encoding("UTF-8")

        # PhotonBot!~ruibot@localhost.localdomain
        data = /(.+)!(.+)@(.+)/.match(@sender_raw)
        @nick = data[1].force_encoding("UTF-8")
        @user = data[2].force_encoding("UTF-8")
        @host = data[3].force_encoding("UTF-8")

        @sendto = if "&#+!".include? @target[0]
                    @target
                  else
                    @nick
                  end

        if "&#+!".include? @target[0]
        else
        end

        ignored = db_ignored?(self.bot, self.sender_raw)
        unless ignored and (@host != @bot.autoowner)
          $cmds.each do |x|
            if data = x[1][0].match(@message)
              RG::Log.write "Starting #{x[1][1].inspect}"
              if $delays[x[0]] == nil
                $delays[x[0]] = 0
              end
              y = ($delays[x[0]] - getsecs).abs
              ignore = false
              if (perm = db_getperm(@bot, @host)) < x[1][3]
                if perm < 0
                  ignore = true
                else
                  fail CMDNoPermError, "Your permission level must be at least #{x[1][3]} to do that!"
                end
              end
              unless ignore
                if ($delays[x[0]] == 0) or (y > x[1][2]) or (y <= 0) or (db_getperm(@bot, @host) >= $nodelaylvl)
                  i = x[1]
                  $delays[x[0]] = getsecs + i[2]
                  i[1].call(self, data)
                else
                  self.bot.a_nctcp @nick, "err: you must wait #{($delays[x[0]] - getsecs)} seconds!"
                end
              end

              RG::Log.write "Finished #{x[1][1].inspect}"
              break
            end
          end
        end
        
      end

      def reply(msg)
        bot.a_privmsg @sendto, msg
      end
      def nreply(msg)
        bot.a_notice @nick, msg
      end
    end
  end
end