module Lionactor
  # A taxonomy term, possibly with child terms
  #
  # @!method id
  #  The term's id.
  #  @return [Fixnum] 
  #     
  # @!method name
  #   The term's name. E.g., "Politics & Government".
  #   @return [String]
  class Term < Resource
    def initialize(data, client=nil)
      super(data, client)
      @terms = nil
    end

    # Whether or not this terms has child terms
    def has_terms?
      ! @data['terms'].nil?
    end

    # Child terms
    # @return [Array<Term>, nil]
    def terms
      if @terms.nil? && has_terms?
        @terms = @data['terms'].map{|t| Lionactor::Term.new(t)}
      end

      @terms
    end
  end
end
