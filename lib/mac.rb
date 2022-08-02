module Mac
end

%w(

  version

  clipboard

).each { |m| require "mac/#{m}" }
