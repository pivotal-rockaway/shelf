require 'rails_helper'

describe "check for empty title and url" do
  it "render error message with blank title and url" do
    visit '/'
    click_on "New Recommendation"
    click_on "Create"
    expect(page).to have_text("Title and Url cannot be empty")
  end

  it "render error message with blank title" do
    visit '/'
    click_on "New Recommendation"
    fill_in "Title", with: ""
    fill_in "Description", with: "Brooklyn wonders"
    fill_in "Url", with: "http://imdb.com/brooklyn"
    fill_in "Tag", with: "#Movies"
    click_on "Create"
    expect(page).to have_text("Title cannot be empty")
  end

  it "render error message with blank url" do
    visit '/'
    click_on "New Recommendation"
    fill_in "Title", with: "Brooklyn"
    fill_in "Description", with: "Brooklyn wonders"
    fill_in "Url", with: ""
    fill_in "Tag", with: "#Movies"
    click_on "Create"
    expect(page).to have_text("Url cannot be empty")
  end
  it "no error" do
    visit '/'
    click_on "New Recommendation"
    fill_in "Title", with: "Brooklyn"
    fill_in "Description", with: "Brooklyn wonders"
    fill_in "Url", with: "http://imdb.com/brooklyn"
    fill_in "Tag", with: "#Movies"
    click_on "Create"
    expect(page).to_not have_content("Title cannot be empty")
    expect(page).to_not have_content("Url cannot be empty")
    expect(page).to_not have_content("Title and Url cannot be empty")
  end

end