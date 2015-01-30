require "spec_helper"

describe Lionactor::Division do
  before :each do
    client = double(Lionactor::Client)

    # Two copies of the parsed JSON so we can manipulate one without affecting
    # the other
    data = JSON.parse(RAREBOOKS)["division"]
    data_wo_features = JSON.parse(RAREBOOKS)["division"]

    # Get just some predetermined features
    features = JSON.parse(FEATURES_FRAG)["features"]

    # Replace whatever features are in the division response with the
    # prefetermined fragment
    data['_embedded']['features'] = features
    @div = Lionactor::Division.new(data, client)

    # Delete whatever features are in the division response
    data_wo_features['_embedded']['features'] = nil
    @div_wo_features = Lionactor::Division.new(data_wo_features, client)
  end

  describe "via automatic methods" do
    describe "#name" do
      it "should have a name" do
        expect(@div.name).to eq "Rare Book Division"
      end
    end
  end

  describe "#has_divisions?" do
    it "is true" do
      expect(@div.has_divisions?).to be true
    end
  end

  describe "#divisions" do
    it "returns an Array" do
      expect(@div.divisions).to be_an_instance_of Array
    end
    
    it "returns an Array of Division objects" do
      expect(@div.divisions.first).to be_an_instance_of Lionactor::Division
    end
  end

  describe "#location" do
    it "is a Location object" do
      expect(@div.location).to be_an_instance_of Lionactor::Location
    end
      
    it "is in SASB" do
      expect(@div.location.name).to eq "Stephen A. Schwarzman Building"
    end
  end

  describe "#has_parent?" do
    it "should not have a parent" do
      expect(@div.has_parent?).to be false
    end

    context "When it's a subdivision" do
      before :each do
        client = double(Lionactor::Client)
        data = JSON.parse(ARENTS)["division"]
        @div = Lionactor::Division.new(data, client)
      end

      it "should have a parent" do
        expect(@div.has_parent?).to be true
      end
    end
  end

  describe "#features" do
    it "returns an Array" do
      expect(@div.features).to be_an_instance_of Array
    end

    it "returns an Array of Feature objects" do
      expect(@div.features.first).to be_an_instance_of Lionactor::Feature
    end

    it "feature should have titles" do
      expect(@div.features.first.title).to eq "Building Inspector"
    end

    context "when the division has no features" do
      it "returns nil" do
        expect(@div_wo_features.features).to be_nil
      end
    end
  end

  describe "#has_features?" do
    context "when the division has features" do
      it "returns true" do
        expect(@div.has_features?).to be true
      end
    end

    context "when the division has no features" do
      it "returns false" do
        expect(@div_wo_features.has_features?).to be false
      end
    end
  end

  describe "#parent" do
    it "should not have a parent" do
      expect(@div.parent).to be_nil
    end

    context "When it's a subdivision" do
      before :each do
        client = double(Lionactor::Client)
        data = JSON.parse(ARENTS)["division"]
        @div = Lionactor::Division.new(data, client)
      end

      it "should have a parent" do
        expect(@div.parent).to be_an_instance_of Lionactor::Division
      end
    end
  end

  describe "#has_terms?" do
    it "should be true for a division" do
      expect(@div.has_terms?).to be true
    end
  end
  
  describe "#terms" do
    it "should return an array" do
      expect(@div.terms).to be_an_instance_of Array
    end

    it "should be an array of Terms" do
      expect(@div.terms.first).to be_an_instance_of Lionactor::Term
    end
  end
end
