module Lionactor
  # A single location. Either a circulating branch or research library.
  #
  # @!method id
  #  The location's id. This is an abbreviation, e.g., "SASB" for the Stephen A.  #  Schwarzman Building.
  #  @return [String] 
  #     
  # @!method name
  #   The location's name. E.g., "Stephen A. Schwarzman Building".
  #   @return [String]
  #
  # @!method slug
  #   A short version of the name for use in URLs. E.g "schwarzman" or 
  #   "battery-park-city"
  #   @return [String]
  #
  # @!method about
  #   A brief description of the location.
  #   @return [String] May contain HTML
  #
  # @!method access
  #   The level of wheelchair accessibility of the location.
  #   @return [String] One of three values "Fully Accessible", "Partially
  #     Accessible", or "Not Accessible"
  # 
  # @!method street_address
  #   The location's street address. E.g. "455 Fifth Avenue"
  #   @return [String]
  #
  # @!method locality
  #   The location's city. E.g. "New York"
  #   @return [String]
  #
  # @!method state
  #   The location's city. E.g. "NY"
  #   @return [String]
  #
  # @!method postal_code
  #   The location's postal (a.k.a. zip) code.
  #   @return [String]
  #
  # @!method cross_street
  #   The location's cross. E.g. "at 42nd Street".
  #   @return [String]
  #
  # @!method type
  #   Locations are either "circulating" or "research" branches. 
  #   @see #is_circulating?
  #   @see #is_research?
  #   @return [String]

  class Location < Resource
    # @param data [Hash] Parsed JSON data for the Location resource
    # @param client [Client] The client that is creating the object
    def initialize(data, client)
      super(data, client)
      @hours = nil
      @amenities = nil
      @divisions = nil
    end

    # The main phone number for the location
    # @return [String]
    def phone
      @data['contacts']['phone']
    end

    # The location's regular operating hours
    # @return [Hours]
    def hours
      if @hours.nil?
        @hours = Lionactor::Hours.new(@data['hours'])
      end

      @hours
    end

    # Returns amenities available at the location
    # @return [Hash] A Hash in which the keys are amenity categories and the
    #   values Arrays of {Lionactor::Amenity} objects
    def amenities
      if @amenities.nil?
        @amenities = @data['_embedded']['amenities'].map do |a|
          Lionactor::LocationAmenity.new(a, @client)
        end
      end

      @amenities
    end

    def features
      if @features.nil?
        @features = embedded['features'].map do |f|
          Lionactor::Feature.new(f)
        end
      end

      @features
    end

    # Whether or not the location is a circulating branch
    # @see #type
    # @return [Boolean]
    def is_circulating?
      type == "circulating"
    end

    # Whether or not the location is a research center
    # @see #type
    # @return [Boolean]
    def is_research?
      type == "research"
    end

    # Whether or not the location is open for regular hours, or closed 
    # long-term for construction or any other reason.
    # @return [Boolean]
    def open?
      @data['open']
    end

    # The location's latitude.
    # @return [Float]
    def latitude
      @data['geolocation']['coordinates'][1]
    end

    # The location's longitude
    # @return [Float]
    def longitude
      @data['geolocation']['coordinates'][0]
    end

    # Whether or not the location has divisions
    def has_divisions?
      ! embedded['divisions'].nil?
    end

    # Research divisions at the location
    # return [Array]
    def divisions
      if @divisions.nil?
        @divisions = embedded['divisions'].map do |d|
          Lionactor::Division.new(d, @client)
        end
      end

      @divisions
    end
  end
end    
