require "spec_helper"

describe Lionactor::LocationAmenity do
  before :each do
    data = JSON.parse(MML)["location"]["_embedded"]["amenities"].first
    @local = Lionactor::LocationAmenity.new(data, nil)
  end

  describe "via automatic methods" do
    describe "#accessible" do
      it "is true" do
        expect(@local.accessible).to eq true
      end
    end

    describe "#accessibility_note" do
      it "does not have an accessibility note" do
        expect(@local.accessibility_note).to be_nil
      end
    end

    describe "#staff_assistance" do
      it "does not require staff assistance" do
        pending "staff_assistance should be boolean"
        expect(@local.staff_assistance).to be false
      end
    end

    describe "#local_rank" do
      it "should be an integer" do
        expect(@local.location_rank).to be_an_instance_of Fixnum
      end

      it "should be 1" do
        expect(@local.location_rank).to eq 1
      end
    end
  end

  describe "#amenity" do
    it "returns an Amenity object" do
      expect(@local.amenity).to be_an_instance_of Lionactor::Amenity
    end

    it "should be have a name" do
      expect(@local.amenity.name).to eq "Computers for Public Use"
    end
  end
end
  
