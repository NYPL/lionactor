module Lionactor
  class Hours < Resource
    def initialize(data)
      super(data)
      @hours = @data['regular'].map{|h| Lionactor::Times.new(h)}
    end

    def [](day)
      @hours.select{|d| d.day.downcase == day.downcase}.first
    end

    def each(&block)
      @hours.each(&block)
    end

    def map(&block)
      @hours.map(&block)
    end
  end
end    
