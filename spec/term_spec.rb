require "spec_helper"

describe Lionactor::Term do
  before :each do
    client = double(Lionactor::Client)
    data = JSON.parse(RAREBOOKS)["division"]
    @term = Lionactor::Division.new(data, client).terms.first
  end

  describe "via automatic methods" do
    describe "#id" do
      it "returns a number" do
        expect(@term.id).to be_an_instance_of Fixnum
      end
      
      it "is correct" do
        expect(@term.id).to eq 41
      end
    end
    
    describe "#name" do
      it "returns a string" do
        expect(@term.name).to be_an_instance_of String
      end
      
      it "is correct" do
        expect(@term.name).to eq "Media"
      end
    end
  end
end
  
