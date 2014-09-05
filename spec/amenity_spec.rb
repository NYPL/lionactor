require "spec_helper"

describe Lionactor::Amenity do
  before :each do
    data = JSON.parse(AMENITIES_MML)["amenities"].first['amenities'].first
    @amenity = Lionactor::Amenity.new(data)
  end

  it "has a name" do
    expect(@amenity.name).to eq "Computers for Public Use"
  end
end

