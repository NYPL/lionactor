module Lionactor
  # A single operation unit. Base class for {Location} and {Division}
  #
  class Unit < Resource
    def initialize(data, client)
      super(data, client)
      @features = nil
    end

    # The Unit's regular operating hours
    # @return [Hours]
    def hours
      if @hours.nil?
        @hours = Lionactor::Hours.new(@data['hours'])
      end

      @hours
    end

    # Whether or not the unit has any Features
    def has_features?
      return ! features.nil?
    end

    # The unit's featured information
    # @return [Array<Feature>]
    def features
      if @features.nil?
        if ! embedded['features'].nil?
          @features = embedded['features'].map do |f|
            Lionactor::Feature.new(f)
          end
        end
      end

      @features
    end


    # Whether or not the unit has associated taxonomy terms
    def has_terms?
      ! @data['terms'].nil?
    end

    # Associated taxonomy terms
    # @return [Array<Term>]
    def terms
      if @terms.nil? && has_terms?
        @terms = @data['terms'].map{|t| Lionactor::Term.new(t)}
      end

      @terms
    end
  end
end
