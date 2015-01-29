module Lionactor
  class Unit < Resource
    def initialize(data, client)
      super(data, client)
      @features = nil
    end

    def has_features?
      return ! features.nil?
    end
    
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


    def has_terms?
      ! @data['terms'].nil?
    end

    def terms
      if @terms.nil? && has_terms?
        @terms = @data['terms'].map{|t| Lionactor::Term.new(t)}
      end

      @terms
    end
  end
end
