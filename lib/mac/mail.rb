require 'mac/application'

module Mac

  def self.mail
    Mail.new
  end

  class Mail < Application

    def initialize
      super 'Mail'
    end

    # With help from:
    # https://daringfireball.net/2007/12/message_urls_leopard_mail
    def selected_messages
      result = tell <<~ENDSCRIPT
        set msgs to selection
        set results to ""
        repeat with msg in msgs
          set results to results & (message id of msg) & "\\t" & (subject of msg) & "\\n"
        end repeat
        return results
      ENDSCRIPT
      result.split("\n").map do |m|
        [:message_id, :subject].zip(m.split("\t")).to_h
      end
    end

  end

end
