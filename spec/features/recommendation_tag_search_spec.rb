require 'rails_helper'
require 'spec_helper'

describe "/recommendations/search" , type: :feature do
  describe "/" do
    it "search recommendations by tag" do
      visit "/"
      3.times {|n| create_recommendation(title: "Brooklyn#{n}", description:"Good Movie", url: "http://imdb.com/brooklyn#{n}", tag: "#Movies")}
      3.times {|n| create_recommendation(title: "Kamimazee#{n}", description:"Nice song", url: "http://imdb.com/brooklyn#{n}", tag: "#Music")}
      visit '/'
      fill_in "query", with: "#Movies"
      click_on "Search"
      expect(page).to have_text("Search Results")
      expect(page).to have_text("Brooklyn0  : Good Movie : http://imdb.com/brooklyn0 : #Movies")
      expect(page).to have_text("Brooklyn1 : Good Movie : http://imdb.com/brooklyn1 : #Movies")
      expect(page).to have_text("Brooklyn2 : Good Movie : http://imdb.com/brooklyn2 : #Movies")
      expect(page).to_not have_text("Kamimazee0 : Nice song : http://imdb.com/brooklyn0 : #Music")
      expect(page).to_not have_text("Kamimazee1 : Nice song : http://imdb.com/brooklyn1 : #Music")
      expect(page).to_not have_text("Kamimazee2 : Nice song : http://imdb.com/brooklyn2 : #Music")
    end
 end
end


