module Lionactor
  # The intersection of a Location and an Amenity.
  class LocationAmenity < Resource
    # @param data [Hash] Parsed JSON data for the Location resource
    # @param client [Client] The client that is creating the object
    def initialize(data, client)
      super(data, client)
      @amenity = Lionactor::Amenity.new(@data["amenity"], client)
    end

    def amenity
      @amenity
    end
  end
end

