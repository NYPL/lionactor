require "spec_helper"

describe Lionactor::Client do
  before :each do
    @client = Lionactor::Client.new

    # Monkey-patch Client object so we can mock the connection
    def @client.conn=(c)
      @conn = c
    end

    def @client.conn
      @conn
    end
  end

  describe "#location" do
    before :each do
      @r = double(Faraday::Response, :body => MML, :headers => {})
      allow_any_instance_of(Faraday::Connection).to receive(:get).
        and_return(@r)
    end

    it "Returns a Location object" do
      loc = @client.location('mid-manhattan-library')
      expect(loc).to be_an_instance_of(Lionactor::Location)
    end
  end
      
end
