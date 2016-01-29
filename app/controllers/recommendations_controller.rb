class RecommendationsController < ApplicationController
  def new
    @recommendation = Recommendation.new
  end

  def index
    @recommendations = Recommendation.all
  end

  def create
    @recommendation = Recommendation.create(params.require(:recommendation).permit([:title, :description, :url, :tag, :likes]))
    if @recommendation.errors.messages.blank?
      render :show
    else
      render :new
    end
  end

  def likes
    @recommendation = Recommendation.find(params[:recommendation_id])
    @recommendation.likes += 1
    @recommendation.save
    redirect_to(root_url)
  end

  def search
    @search_results = Recommendation.where(tag: params[:query])
  end

end
