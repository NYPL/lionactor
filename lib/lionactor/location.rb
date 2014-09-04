module Lionactor
  class Location < Resource
    def phone
      @data['contacts']['phone']
    end

  end
end    
