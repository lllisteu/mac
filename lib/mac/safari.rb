module Mac

  def self.safari
    Safari.new
  end

  class Safari < Application

    def initialize
      super 'Safari'
    end

    def url
      tell_if_running_and_has_document 'return url of front document'
    end

    def title
      tell_if_running_and_has_document 'return name of front document'
    end

    def selected_text
      tell_if_running_and_has_document 'do JavaScript "window.getSelection().toString();" in front document'
    end

    def text
      tell_if_running_and_has_document 'return text of front document'
    end

    def source
      tell_if_running_and_has_document 'return source of front document'
    end

    private

    def tell_if_running_and_has_document(script)
      tell <<~ENDSCRIPT
        if it is running then
          if (number of documents) > 0 then
            #{script}
          end if
        end if
      ENDSCRIPT
    end

  end

end
