module Mac
end

%w(

  version

  clipboard

  application

).each { |m| require "mac/#{m}" }
