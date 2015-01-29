require "spec_helper"

describe Lionactor::Term do
  before :each do
    client = double(Lionactor::Client)
    data = JSON.parse(RAREBOOKS)["division"]
    @all = JSON.parse(TERMS)["terms"].map{|t| Lionactor::Term.new(t, client)}
    @term = @all.first
    @lit = @term.terms.last
  end

  describe "via automatic methods" do
    describe "#id" do
      it "returns a number" do
        expect(@term.id).to be_an_instance_of Fixnum
      end
      
      it "is correct" do
        expect(@term.id).to eq 42
      end
    end
    
    describe "#name" do
      it "returns a string" do
        expect(@term.name).to be_an_instance_of String
      end
      
      it "is correct" do
        expect(@term.name).to eq "Subjects"
      end
    end
  end

  context "with child terms" do
    describe "#terms" do
      it "should return an Array" do
        expect(@term.terms).to be_an_instance_of Array
      end
    end

    describe "#has_terms?" do
      it "should return true" do
        expect(@term.has_terms?).to be true
      end
    end
  end

  context "with no child terms" do
    describe "#terms" do
      it "should be nil" do
        expect(@lit.terms).to be_nil
      end
    end
  end

  describe "#has_terms?" do
    it "should return false" do
      expect(@lit.has_terms?).to be false
    end
  end
end
  
