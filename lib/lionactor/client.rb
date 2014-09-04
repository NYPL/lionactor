module Lionactor
  class Client
    def initialize
      @conn = Faraday.new
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
      return "http://locations-api-beta.nypl.org/#{path}"
    end
  end
end
