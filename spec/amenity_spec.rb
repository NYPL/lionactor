require "spec_helper"
require "pp"

describe Lionactor::Amenity do
  before :each do
    data = JSON.parse(AMENITY)["amenity"]
    @amenity = Lionactor::Amenity.new(data, nil)
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
end

