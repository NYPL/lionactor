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

    protected
    def get_endpoint(path)
      response = @conn.get(api_path("locations"))
      JSON.parse response.body
    end
    
    def api_path(path)
      return "http://locations-api-beta.nypl.org/#{path}"
    end
  end
end
