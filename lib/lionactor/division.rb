module Lionactor
  class Division < Unit
    def initialize(data, client)
      super(data, client)
      @hours = nil
      @divisions = nil
      @location = nil
      @parent = nil
      @terms = nil
    end

    def location
      if @location.nil?
        @location = Lionactor::Location.new(embedded['location'], @client)
      end

      @location
    end

    # Whether or not the division has sub-divisions
    def has_divisions?
      ! embedded['divisions'].nil?
    end

    # Sub-divisions
    # return [Array]
    def divisions
      if @divisions.nil?
        @divisions = embedded['divisions'].map do |d|
          Lionactor::Division.new(d, @client)
        end
      end

      @divisions
    end

    # Whether or not the division is a sub-division and has a parent
    def has_parent?
      ! embedded['parent'].nil?
    end

    def parent
      if @parent.nil? && has_parent?
        @parent = Lionactor::Division.new(embedded['parent'], @client)
      end

      @parent
    end
  end
end    
