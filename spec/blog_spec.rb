require "spec_helper"

describe Lionactor::Blog do
  before :each do
    data = JSON.parse(MML)["location"]["_embedded"]["blogs"][3]
    @blog = Lionactor::Blog.new(data)
  end

  describe "via automatic methods" do
    describe "#title" do
      it "has a title" do
        expect(@blog.title).to be_an_instance_of String
      end
    end

    describe "#body" do
      it "has a body" do
        expect(@blog.body).to be_an_instance_of String
      end
    end

    describe "#image" do
      it "has an image" do
        expect(@blog.image).to be_an_instance_of String
      end
    end

    describe "#pubdate" do
      it "it is a date" do
        expect(@blog.pubdate).to be_an_instance_of DateTime
      end

    end

    describe "#author" do
      it "is an OpenStruct object" do
        expect(@blog.author).to be_an_instance_of OpenStruct
      end

      it "has a name" do
        expect(@blog.author.name).to be_an_instance_of String
      end

      it "has a location" do
        expect(@blog.author.location).to be_an_instance_of String
      end
    end
  end
end
