module RecommendationHelper
  def create_recommendation(options)
    visit '/'
    click_on "New Recommendation"
    fill_in "Title", with: options[:title]
    fill_in "Description", with: options[:description]
    fill_in "Url", with: options[:url]
    fill_in "Tag", with: options[:tag]
    click_on "Create"
  end
end