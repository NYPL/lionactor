module Lionactor
  class Amenity < Resource
    def initialize(data, client)
      super(data, client)
      @locations = nil
    end

    def set_locations(loc)
      @locations = loc
    end

    def locations
      @locations
    end
    
  end
end    
