module Lionactor
  class Client
    def initialize(api="http://locations.api.nypl.org/api/v0.5")
      @api = api
      @conn = Faraday.new
    end

    def amenities(loc = nil)
      if loc.nil?
        path = 'amenities'
      else
        path = "amenities/#{loc}"
      end

      get_endpoint(path)['amenities'].map do |a|
        Lionactor::Amenity.new(a, @client)
      end
    end

    def amenity(id)
      path = "amenities/#{id}"
      resource = get_endpoint(path)
      amenity = Lionactor::Amenity.new(resource['amenity'], @client)
      locations = resource['locations'].map do |l|
        Lionactor::Location.new(l, @client)
      end
      amenity.set_locations(locations)
      return amenity
    end

    def locations
      get_endpoint('locations')['locations'].map do |loc|
        Lionactor::Location.new(loc, @client)
      end
    end

    def location(loc)
      resource = get_endpoint("locations/#{loc}")
      Lionactor::Location.new(resource['location'], @client)
    end

    def divisions
      get_endpoint('divisions')['divisions'].map do |div|
        Lionactor::Division.new(div, @client)
      end
    end

    def division(div)
      resource = get_endpoint("divisions/#{div}")
      Lionactor::Division.new(resource['division'], @client)
    end

    protected
    def get_endpoint(path)
      response = @conn.get(api_path(path))
      JSON.parse response.body
    end
    
    def api_path(path)
      return "#{@api}/#{path}"
    end
  end
end
