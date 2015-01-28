module Lionactor
  class Term < Resource
    def initialize(data, client=nil)
      super(data, client)
      @terms = nil
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
