module Lionactor
  class Unit < Resource
    def initialize(data, client)
      super(data, client)
      @features = nil
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

  end
end
