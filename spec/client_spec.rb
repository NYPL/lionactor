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

  describe "#locations" do 
    before :each do
      @r = double(Faraday::Response, :body => LOCATIONS, :headers => {})
      allow_any_instance_of(Faraday::Connection).to receive(:get).
        and_return(@r)
    end
    
    it "returns an array of Location objects" do
      locs = @client.locations
      expect(locs.map{|l| l.class}.uniq).to eq [Lionactor::Location]
    end
  end

  describe "#amenities" do
    context "with no location specified" do
      before :each do
        @r = double(Faraday::Response, :body => AMENITIES, :headers => {})
        allow_any_instance_of(Faraday::Connection).to receive(:get).
          and_return(@r)
      end
      
      it "returns an array of Amenities objects" do
        locs = @client.amenities
        expect(locs.map{|l| l.class}.uniq).to eq [Lionactor::Amenity]
      end
    end

    context "with a location specified" do 
      before :each do
        @r = double(Faraday::Response, :body => AMENITIES_MML, :headers => {})
        allow_any_instance_of(Faraday::Connection).to receive(:get).
          and_return(@r)
      end
      
      it "returns an array of Amenities objects" do
        locs = @client.amenities("mml")
        expect(locs.map{|l| l.class}.uniq).to eq [Lionactor::Amenity]
      end
    end
  end
end
