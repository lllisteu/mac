module Mac
end

%w(

  version

  clipboard

  application

  mail safari

).each { |m| require "mac/#{m}" }
