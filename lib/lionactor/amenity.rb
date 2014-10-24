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

    # Indicate whether or not the resource has an associated action
    def action?
      return ! links["action"].nil?
    end

    # Return the associated action. Returned object will have href and name
    # properties.
    # @return [OpenStruct]
    def action
      return OpenStruct.new(links["action"]) if action?
      return nil
    end 

    # Indicate whether or not the resource has an associated info link
    def info?
      return ! links["info"].nil?
    end

    # Return the associated info linke. Returned object will have an href
    # property.
    # @return [OpenStruct]
    def info
      return OpenStruct.new(links["info"]) if info?
      return nil
    end 

    def locations
      if @locations.nil?
        if (! embedded.nil?) and (! embedded["locations"].nil?)
          @locations = embedded["locations"].map{|l| 
            Lionactor::Location.new(l, @client)
          }
        end
      end
      @locations
    end
  end
end    
