require "spec_helper"

describe Lionactor::Blog do
  before :each do
    data = JSON.parse(MML)["location"]["_embedded"]["blogs"][3]
    @blog = Lionactor::Blog.new(data)
  end

  describe "via automatic methods" do
    describe "#title" do
      it "has a title" do
        expect(@blog.title).to eq "Little Orphant Annie by James Whitcomb Riley"
      end
    end

    describe "#body" do
      it "has a body" do
        expect(@blog.body).to start_with "Hoosier poet James Whitcomb Riley"
      end
    end

    describe "#image" do
      it "has an image" do
        expect(@blog.image).to eq "http://images.nypl.org/index.php?id=2006225&t=w"
      end
    end

    describe "#pubdate" do
      it "it is a date" do
        expect(@blog.pubdate).to be_an_instance_of DateTime
      end

      it "is the right date" do
        expect(@blog.pubdate).to eq DateTime.new(2014, 9, 10, 17, 20, 12)
      end
    end

    describe "#author" do
      it "is an OpenStruct object" do
        expect(@blog.author).to be_an_instance_of OpenStruct
      end

      it "has a name" do
        expect(@blog.author.name).to eq "Lois Moore"
      end

      it "has a location" do
        expect(@blog.author.location).to eq "Mid-Manhattan Library"
      end

      it "has a position" do
        expect(@blog.author.position).to eq "Senior Librarian"
      end
    end
  end
end
