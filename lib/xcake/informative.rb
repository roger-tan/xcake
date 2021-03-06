require "claide"
require "tty"

# Indicates an user error.
#
module Xcake
  class Informative < StandardError
    include CLAide::InformativeError

    def message
      pastel = Pastel.new
      pastel.red "[!] #{super}"
    end
  end
end
