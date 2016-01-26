require 'rails_helper'

describe RecommendationsController do
  describe "new" do
    it "returns success" do
      get :new
      expect(response).to be_success
      expect(assigns(:recommendation)).to be_a_new(Recommendation)
    end
  end

  describe "create" do
    before do
      post :create, recommendation: {title: "Batman vs Superman", url: "http://www.imdb.com/title/tt2975590/"}
    end

    it "returns successful response" do
      expect(response).to be_success
    end

    it "creates a new recommendation" do
      recommendation = assigns(:recommendation)
      expect(recommendation.title).to eq "Batman vs Superman"
      expect(recommendation.url).to eq "http://www.imdb.com/title/tt2975590/"
    end

    it "renders show page" do
      expect(response).to render_template(:show)
    end
  end
end
