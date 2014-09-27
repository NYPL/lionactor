module Lionactor
  # A single amenity.
  #
  # @!method id
  #  The amenity's id.
  #  @return [String] 
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
