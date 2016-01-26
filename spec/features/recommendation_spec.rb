require 'rails_helper'

describe "Creating recommendations", type: :feature do
  it "renders a form with title and url" do
    visit '/'
    expect(page).to have_text("Create new recommendation")
    fill_in "Title", with: "Brooklyn"
    fill_in "Url", with: "http://imdb.com/brooklyn"
    click_on "Create"
    expect(page).to have_text("Voila! you just created a new recommendation")
    expect(page).to have_text("Brooklyn: http://imdb.com/brooklyn")
  end
end