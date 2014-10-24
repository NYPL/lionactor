require "spec_helper"

describe Lionactor::Feature do
  before :each do
    data = JSON.parse(MML)["location"]["_embedded"]["features"].first
    @feature = Lionactor::Feature.new(data)
  end

  describe "via automatic methods" do
    describe "#body" do
      it "should have a body" do
        expect(@feature.body).to start_with "<p>Visit the Picture Collection"
      end
    end

    describe "#image" do
      it "should have an image link" do
        expect(@feature.image).to eq "http://cdn-prod.www.aws.nypl.org/sites/default/files/images/features/mmpc.jpeg"
      end
    end

    describe "#title" do
      it "should have a title" do
        expect(@feature.title).to eq "The Picture Collection"
      end
    end
  end

  describe "#links" do
    describe "#self" do
      it "should give a link to itself" do
        expect(@feature.links['self']['href']).to eq "http://www.nypl.org/about/locations/mid-manhattan-library/picture-collection"
      end
    end
  end
end



