module Lionactor
  class Blog < Resource
    attr_reader :pubdate, :author
    # @param data [Hash] Parsed JSON data for the Location resource
    def initialize(data)
      super(data)
      @pubdate = DateTime.strptime(data['pubdate'])
      @author = OpenStruct.new(data['author'])
    end
  end
end
