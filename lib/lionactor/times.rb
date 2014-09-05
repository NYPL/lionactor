module Lionactor
  class Times < Resource

    def closedOn?
      return @data['open'].nil?
    end

    def openOn?
      return ! closedOn?
    end
  end
end    
