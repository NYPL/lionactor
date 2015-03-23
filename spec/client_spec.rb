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
      @r = double(Faraday::Response, :body => MML, :headers => {}, :status => 200)
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
      @r = double(Faraday::Response, :body => LOCATIONS, :headers => {}, :status => 200)
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
        @r = double(Faraday::Response, :body => AMENITIES, :headers => {}, :status => 200)
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
        @r = double(Faraday::Response, :body => AMENITIES_MML, :headers => {}, :status => 200)
        allow_any_instance_of(Faraday::Connection).to receive(:get).
          and_return(@r)
      end
      
      it "returns an array of Amenities objects" do
        locs = @client.amenities("mml")
        expect(locs.map{|l| l.class}.uniq).to eq [Lionactor::Amenity]
      end
    end
  end

  describe "#amenity" do
    before :each do
      @r = double(Faraday::Response, :body => AMENITY, :headers => {}, :status => 200)
      allow_any_instance_of(Faraday::Connection).to receive(:get).
        and_return(@r)
      @amenity = @client.amenity(0)
    end

    it "returns an Amenity" do
      expect(@amenity).to be_an_instance_of Lionactor::Amenity
    end
  end

  describe "#terms" do
    before :each do
      @r = double(Faraday::Response, :body => TERMS, :headers => {}, :status => 200)
      allow_any_instance_of(Faraday::Connection).to receive(:get).
        and_return(@r)
      @terms = @client.terms
    end

    it "returns an array" do
      expect(@terms).to be_an_instance_of Array
    end

    it "returns an array of Term objects" do
      expect(@terms.first).to be_an_instance_of Lionactor::Term
    end
  end
end
