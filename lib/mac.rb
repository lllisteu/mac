module Mac
end

%w(

  version

).each { |m| require "mac/#{m}" }
