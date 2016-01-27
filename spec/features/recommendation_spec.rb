require 'rails_helper'

describe "Recommendations", type: :feature do
  describe "/" do
    it "show already created recommendations" do
      visit '/'
      click_on "New Recommendation"
      fill_in "Title", with: "Brooklyn"
      fill_in "Description", with: " "
      fill_in "Url", with: "http://imdb.com/brooklyn"
      fill_in "Tag", with: "#Movies"
      click_on "Create"
      visit '/'
      click_on "New Recommendation"
      fill_in "Title", with: "Avengers"
      fill_in "Description", with: " "
      fill_in "Url", with: "http://youtube.com/avengers"
      fill_in "Tag", with: "#Fantasy"
      click_on "Create"
      visit '/'
      expect(page).to have_text("Recommendations For You")
      expect(page).to have_text("Brooklyn : : http://imdb.com/brooklyn : #Movies")
      expect(page).to have_text("Avengers : : http://youtube.com/avengers : #Fantasy")
      expect(page).to have_text(" ")
      expect(page).to have_link("+1")
    end

    it "increment likes" do
      visit '/'
      save_and_open_page
      click_on "New Recommendation"
      fill_in "Title", with: "Brooklyn Bridge"
      fill_in "Url", with: "http://www.brooklynbridge.com"
      click_on "Create"
      visit '/'
      click_on "+1"
    end

end

  describe "/recommendations/new" do
    it "renders a form with title, description and url" do
      visit '/'
      click_on "New Recommendation"
      expect(page).to have_text("Your new recommendation")
      fill_in "Title", with: "Brooklyn"
      fill_in "Description", with: "Brooklyn is a great watch"
      fill_in "Url", with: "http://imdb.com/brooklyn"
      fill_in "Tag", with: "#Movies"
      click_on "Create"
      expect(page).to have_text("Voila! you just created a new recommendation")
      expect(page).to have_text("Brooklyn : Brooklyn is a great watch : http://imdb.com/brooklyn : #Movies")
    end
  end
end