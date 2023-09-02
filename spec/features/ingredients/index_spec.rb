require "rails_helper"

RSpec.describe Ingredient, type: :feature do
  it "As a visitor,
  When I visit '/ingredients'
  I see a list of all the ingredients including their name and cost
  (e.g. 'Ground Beef: 2' 'Salt: 4')" do 
    ingredient_1 = Ingredient.create(name: "Ground Beef", cost: 2)
    ingredient_2 = Ingredient.create(name: "Salt", cost: 4)

    visit "/ingredients"

    save_and_open_page
    expect(page).to have_content("Ground Beef: 2")
    expect(page).to have_content("Salt: 4")
  end
end
