require 'rails_helper'

describe "/recommendations/new",type: :feature do
  it "renders a form with title,description,url and tag" do
    visit '/'
    click_on "New Recommendation"
    expect(page).to have_text("Your new recommendation")
    fill_in "Title", with: "Brooklyn"
    fill_in "Description", with: "Brooklyn is a great watch"
    fill_in "Url", with: "http://imdb.com/brooklyn"
    fill_in "Tag", with: "#Movies"
    click_on "Create"
    expect(page).to have_text("Voila! you just created a new recommendation with a tag")
    expect(page).to have_text("Brooklyn : Brooklyn is a great watch : http://imdb.com/brooklyn : #Movies")
  end
end