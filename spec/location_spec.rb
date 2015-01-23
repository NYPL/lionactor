require "spec_helper"

describe Lionactor::Location do
  context "with a circulating branch" do
    before :each do
      client = double(Lionactor::Client)
      data = JSON.parse(MML)["location"]
      @loc = Lionactor::Location.new(data, client)
    end

    describe "via automatic methods" do
      it "has an id" do
        expect(@loc.id).to eq "MML"
      end

      it "has a name" do
        expect(@loc.name).to eq "Mid-Manhattan Library"
      end

      it "has a slug" do
        expect(@loc.slug).to eq "mid-manhattan-library"
      end

      it "has an about statement" do
        expect(@loc.about).to start_with "Established in 1970"
      end

      it "is fully accessible" do
        expect(@loc.access).to eq "Fully Accessible"
      end

      it "has a street address" do
        expect(@loc.street_address).to eq "455 Fifth Avenue"
      end

      it "has a city" do
        expect(@loc.locality).to eq "New York"
      end

      it "has a state" do
        expect(@loc.region).to eq "NY"
      end

      describe "#postal code" do
        it "should be a string" do
          expect(@loc.postal_code).to be_an_instance_of(String)
        end

        it "has a postal code" do
          expect(@loc.postal_code).to eq "10016"
        end
      end

      it "has a cross street" do
        expect(@loc.cross_street).to eq "at 40th Street"
      end

      it "has a type" do
        expect(@loc.type).to eq "circulating"
      end      
    end

    describe "#amenities" do
      it "returns a array" do
        expect(@loc.amenities).to be_an_instance_of Array
      end

      it "returns an Array of LocationAmenity objects" do
        expect(@loc.amenities.first)
          .to be_an_instance_of Lionactor::LocationAmenity
      end
    end

    describe "#is_circulating?" do
      it "is true" do
        expect(@loc.is_circulating?).to be true
      end
    end

    describe "#is_research?" do
      it "is false" do
        expect(@loc.is_research?).to be false
      end
    end

    describe "#open?" do
      it "is true" do
        expect(@loc.open?).to be true
      end
    end

    describe "#latitude" do
      it "is a Float" do
        expect(@loc.latitude).to be_a Float
      end

      it "is 40.7518" do
        expect(@loc.latitude).to eq 40.7518
      end
    end

    describe "#longitude" do
      it "is a Float" do
        expect(@loc.longitude).to be_a Float
      end

      it "is -73.9817" do
        expect(@loc.longitude).to eq -73.9817
      end
    end

    describe "#features" do
      it "returns an Array" do
        expect(@loc.features).to be_an_instance_of Array
      end

      it "returns an Array of Feature objects" do
        expect(@loc.features.first).to be_an_instance_of Lionactor::Feature
      end

      it "feature should have titles" do
        expect(@loc.features.first.title).to eq "The Picture Collection"
      end
    end

    describe "#has_divisions?" do
      it "is false" do
        expect(@loc.has_divisions?).to be false
      end
    end
  end

  context "With a research branch" do
    before :each do
      client = double(Lionactor::Client)
      data = JSON.parse(SASB)["location"]
      @loc = Lionactor::Location.new(data, client)
    end

    describe "#is_circulating?" do
      it "is false" do
        expect(@loc.is_circulating?).to be false
      end
    end

    describe "#is_research?" do
      it "is true" do
        expect(@loc.is_research?).to be true
      end
    end

    describe "#has_divisions?" do
      it "is true" do
        expect(@loc.has_divisions?).to be true
      end
    end

    describe "#divisions" do
      it "returns an Array" do
        expect(@loc.divisions).to be_an_instance_of Array
      end

      it "returns an Array of Division objects" do
        expect(@loc.divisions.first).to be_an_instance_of Lionactor::Division
      end
    end
  end
end
 
