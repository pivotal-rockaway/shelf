require 'rails_helper'

describe RecommendationsController do
  describe "new" do
    it "returns success" do
      get :new
      expect(response).to be_success
      expect(assigns(:recommendation)).to be_a_new(Recommendation)
    end
  end

  describe "index" do
    it "returns all recommendations" do
      get :index
      3.times {|n| Recommendation.create(title: "title #{n}", description: "Desc #{n}", url: "http://imdb.com/title-#{n}")}
      expect(assigns(:recommendations).collect(&:title)).to match_array(["title 0", "title 1", "title 2"])
      expect(assigns(:recommendations).collect(&:description)).to match_array(["Desc 0", "Desc 1", "Desc 2"])
    end
  end

  describe "create" do
    before do
      post :create, recommendation: {title: "Batman vs Superman", description: "Batman fights Superman in an epic battle", url: "http://www.imdb.com/title/tt2975590/", tag: "#Movies"}
    end

    it "returns successful response" do
      expect(response).to be_success
    end

    it "creates a new recommendation" do
      recommendation = assigns(:recommendation)
      expect(recommendation.title).to eq "Batman vs Superman"
      expect(recommendation.description).to eq "Batman fights Superman in an epic battle"
      expect(recommendation.url).to eq "http://www.imdb.com/title/tt2975590/"
      expect(recommendation.tag).to eq "#Movies"
    end

    it "renders show page" do
      expect(response).to render_template(:show)
    end
  end

  describe "likes" do
    before do
      @recommendation = Recommendation.create(title: "Hello", url: "http://www.google.com")
      get :likes, recommendation_id: @recommendation.id
    end

    it "redirects to index page" do
      expect(response).to redirect_to("/")
    end

    it "increment likes" do
      expect(@recommendation.reload.likes).to eq 2
    end
  end
end
