require "spec_helper"

describe Lionactor::Location do
  before :each do
    client = double(Lionactor::Client)
    data = JSON.parse(MML)["location"]
    @loc = Lionactor::Location.new(data, client)
  end

  it "has a name" do
    expect(@loc.name).to eq "Mid-Manhattan Library"
  end

  it "has an about statement" do
    expect(@loc.about).to start_with "Established in 1970"
  end

  it "is fully accessible" do
    expect(@loc.access).to eq "Fully Accessible"
  end
end
 
