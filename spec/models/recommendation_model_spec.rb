require 'rails_helper'

describe Recommendation do

  context "validations" do
    it "always has a title" do
      expect(Recommendation.create(title: "", description: "Sample Desc", url: "http://google.com", tag:"#movies")).to_not be_valid
      expect(Recommendation.create(title: "title", description: "Sample Desc", url: "http://google.com", tag:"#movies")).to be_valid
    end

    it "always has a url" do
      expect(Recommendation.create(title: "title", description: "Sample Desc", url: "", tag:"#movies")).to_not be_valid
      expect(Recommendation.create(title: "title", description: "Sample Desc", url: "http://google.com", tag:"#movies")).to be_valid
    end
  end
end

