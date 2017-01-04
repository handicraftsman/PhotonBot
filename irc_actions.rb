module App
  class Bot
    def a_join(chans)
      self.write "JOIN #{chans}"
      self
    end
    def a_part(chans)
      self.write "PART #{chans}"
      self
    end
    def a_partm(chans, msg)
      self.write "PART #{chans} :#{msg}"
      self
    end
    def a_privmsg(target, msg)
      msg.to_s.spliteach(400).each do |s|
        self.write "PRIVMSG #{target} :\u200B#{s}"
      end
      self
    end
    def a_ctcp(target, msg)
      self.write "PRIVMSG #{target} :\x01#{msg}\x01"
      self
    end
    def a_action(target, msg)
      self.a_ctcp target, "ACTION #{msg}"
      self
    end
    def a_notice(target, msg)
      msg.to_s.spliteach(400).each do |s|
        self.write "NOTICE #{target} :\u200B#{s}"
      end
      self
    end
    def a_nctcp(target, msg)
      self.write "NOTICE #{target} :\x01#{msg}\x01"
      self
    end
    def a_ban(channel, target)
      self.write "MODE #{channel} +b #{target}"
      self
    end
    def a_unban(channel, target)
      self.write "MODE #{channel} -b #{target}"
      self
    end
    def a_op(channel, target)
      self.write "MODE #{channel} +o #{target}"
      self
    end
    def a_deop(channel, target)
      self.write "MODE #{channel} -o #{target}"
      self
    end
    def a_hop(channel, target)
      self.write "MODE #{channel} +h #{target}"
      self
    end
    def a_dehop(channel, target)
      self.write "MODE #{channel} -h #{target}"
      self
    end
    def a_voice(channel, target)
      self.write "MODE #{channel} +v #{target}"
      self
    end
    def a_devoice(channel, target)
      self.write "MODE #{channel} -v #{target}"
      self
    end
    def a_exempt(channel, target)
      self.write "MODE #{channel} +e #{target}"
      self
    end
    def a_unexempt(channel, target)
      self.write "MODE #{channel} -e #{target}"
      self
    end
  end
end