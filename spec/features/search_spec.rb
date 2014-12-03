require 'rails_helper.rb'

feature "Looking up recipes", js: true do
  before do
    Recipe.create!(name: 'Baked Brussel Sprouts')
    Recipe.create!(name: 'Baked Potato w/ Cheese')
    Recipe.create!(name: 'Garlic Mashed Potatoes')
    Recipe.create!(name: 'Potatoes Au Gratin')
  end

  scenario "finding recipes" do
    visit '/'
    fill_in "keywords", with: "baked"
    click_on "Search"

    expect(page).to have_content("Baked Potato w/ Cheese")
    expect(page).to have_content("Baked Brussel Sprouts")
  end
end
