require "spec_helper"
require "pp"

describe Lionactor::Amenity do
  context "When loaded from single amenity endpoint" do
    before :each do
      data = JSON.parse(AMENITY)["amenity"]
      @amenity = Lionactor::Amenity.new(data, nil)

      data = JSON.parse(AMENITY_NO_ACTION)["amenity"]
      @no_action = Lionactor::Amenity.new(data, nil)
    end

    describe "via automatic methods" do
      describe "#id" do
        it "returns a string" do
          pending "the API returning amenity ids as strings"
          expect(@amenity.id).to be_an_instance_of String
        end

        it "is correct" do
          pending "the API returning amenity ids as strings"
          expect(@amenity.id).to eq "7950"
        end
      end

      describe "#name" do
        it "returns a string" do
          expect(@amenity.name).to be_an_instance_of String
        end

        it "is correct" do
          expect(@amenity.name).to eq "Computers for Public Use"
        end
      end
      
      describe "#rank" do
        it "returns an Integer" do
          expect(@amenity.rank).to be_an_instance_of Fixnum
        end
        
        it "is correct" do
          expect(@amenity.rank).to eq 1
        end
      end
      
      describe "#category" do
        it "returns a string" do
          expect(@amenity.category).to be_an_instance_of String
        end
        
        it "is correct" do
          expect(@amenity.category).to eq "Computer Services"
        end
      end
    end

    describe "#action?" do
      it "has an action" do
        expect(@amenity.action?).to eq true
      end

      context "With an amenity that has no action or info" do
        describe "#action?" do
          it "does not have an action" do
            expect(@no_action.action?).to eq false
          end
        end
      end
    end

    describe "#action" do
      it "returns an OpenStruct" do
        expect(@amenity.action).to be_an_instance_of OpenStruct
      end

      it "has an href property" do
        # pending "Resolution of LOC-442"
        expect(@amenity.action.href).to eq "http://pcreserve.nypl.org/"
      end

      it "has a name property" do
        expect(@amenity.action.name).to eq "Reserve a PC"
      end

      context "With an amenity that has no action" do
        describe "#action" do
          it "returns nil" do
            expect(@no_action.action).to be_nil
          end
        end
      end
    end

    describe "#info?" do
      it "has an info link" do
        expect(@amenity.info?).to be true
      end

      context "With an amenity that has no action or info" do
        describe "#info?" do
          it "has an info link" do
            expect(@no_action.info?).to be false
          end
        end
      end
    end
    
    describe "#info" do
      it "returns an OpenStruct" do
        expect(@amenity.info).to be_an_instance_of OpenStruct
      end

      it "has an href property" do
        expect(@amenity.info.href).to eq "http://www.nypl.org/help/computers-internet-and-wireless-access/reserving-computer"
      end

      context "With an amenity that has no action" do
        describe "#info" do
          it "returns nil" do
            expect(@no_action.info).to be_nil
          end
        end
      end
    end

    describe "#locations" do
      it "returns an array" do
        expect(@amenity.locations).to be_an_instance_of Array
      end
      
      it "returns an array of Location objects" do
        expect(@amenity.locations.first)
          .to be_an_instance_of Lionactor::Location
      end
    end
  end

  context "When loaded as part of an location" do
    before :each do
      data = JSON.parse(MML)["location"]["_embedded"]["amenities"]
        .select{|a| a["amenity"]["name"] == "Computers for Public Use"}.first
      @amenity = Lionactor::Amenity.new(data, nil)
    end

    describe "#locations" do
      it "should be nil" do
        expect(@amenity.locations).to be_nil
      end
    end
  end
    
end

