class RecommendationsController < ApplicationController
  def new
    @recommendation = Recommendation.new
  end

  def index
    @recommendations = Recommendation.all
  end

  def create
    @recommendation = Recommendation.create(params.require(:recommendation).permit([:title, :url]))
    render :show
  end
end
