module Mac

  def self.app(name)
    Application.new name
  end

  class Application

    def initialize(name)
      @name = tell('get name', name)
    end

    def name
      @name
    end

    def inspect
      %Q(#{name} (#{self.class.name}))
    end

    def running?
      (tell 'it is running') == 'true'
    end

    def run
      tell 'run'
    end

    def activate
      tell 'activate'
    end

    def quit
      tell 'quit'
    end

    def version
      tell 'return version'
    end

    def tell(script, application=name)
      osascript build_osa_script(script, application)
    end

    def osascript(script)
      `osascript -e '#{script}'`.force_encoding('UTF-8').chomp
    end

    def build_osa_script(script,application=name)
      <<~ENDSCRIPT
        tell application "#{application}"
          #{script.chomp.gsub /\n/, "\n  "}
        end tell
      ENDSCRIPT
    end

  end

end
