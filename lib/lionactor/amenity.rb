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

    def action?
      return ! links["action"].nil?
    end

    def action
      return OpenStruct.new(links["action"]) if action?
      return nil
    end 

    def info?
      return ! links["info"].nil?
    end

    def info
      return OpenStruct.new(links["info"]) if info?
      return nil
    end 

    def locations
      if @locations.nil?
        if (! @data["_embedded"].nil?) and (! @data["_embedded"]["locations"].nil?)
          @locations = @data["_embedded"]["locations"].map{|l| 
            Lionactor::Location.new(l, @client)
          }
        end
      end
      @locations
    end
  end
end    
