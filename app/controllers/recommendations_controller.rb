class RecommendationsController < ApplicationController
  def new
    @recommendation = Recommendation.new
  end

  def index
    @recommendations = Recommendation.all
  end

  def create
    @recommendation = Recommendation.create(params.require(:recommendation).permit([:title, :url, :tag, :likes]))
    render :show
  end

  def likes
    @recommendation = Recommendation.find(params[:recommendation_id])
    @recommendation.likes += 1
    @recommendation.save
    redirect_to(root_url)
  end

end
