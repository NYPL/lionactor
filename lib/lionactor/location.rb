module Lionactor
  class Location < Resource
    def initialize(data, client)
      super(data, client)
      @hours = nil
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

  end
end    
