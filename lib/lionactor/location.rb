module Lionactor
  class Location < Resource
    def initialize(data, client)
      super(data, client)
      @hours = nil
      @amenities = nil
    end

    def phone
      @data['contacts']['phone']
    end

    def hours
      if @hours.nil?
        @hours = Lionactor::Hours.new(@data['hours'])
      end

      @hours
    end

    def amenities
      if @amenities.nil?
        @amenities = {}
        @data['_embedded']['amenities'].each do |cat|
          @amenities[cat['name']] = cat['amenities'].map do |a|
            Lionactor::Amenity.new(a)
          end
        end
      end

      @amenities
    end

    def is_circulating?
      type == "circulating"
    end

    def is_research?
      type == "research"
    end

    def open?
      @data['open']
    end

    def latitude
      @data['geolocation']['coordinates'][1]
    end

    def longitude
      @data['geolocation']['coordinates'][0]
    end
  end
end    
