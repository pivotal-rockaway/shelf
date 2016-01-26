class RecommendationsController < ApplicationController
  def new
    @recommendation = Recommendation.new
  end

  def create
    @recommendation = Recommendation.create(params.require(:recommendation).permit([:title, :url]))
    render :show
  end
end
