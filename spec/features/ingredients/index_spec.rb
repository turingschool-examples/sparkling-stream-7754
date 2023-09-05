require "rails_helper"


RSpec.describe "constellations index page", type: :feature do
  before :each do
    @ingred_1 = Ingredient.create!(
      name: "Cheese",
      cost: 4
    )
    @ingred_2 = Ingredient.create!(
      name: "Milk",
      cost: 3
    )
    @ingred_3 = Ingredient.create!(
      name: "Eggs",
      cost: 7
    )
    @ingred_3 = Ingredient.create!(
      name: "Mushrooms",
      cost: 5
    )

  end


# ------- User Story 1 - Ingredients Index
# As a visitor,
# When I visit '/ingredients'
# I see a list of all the ingredients including their name and cost
# (e.g. "Ground Beef: 2" "Salt: 4")

  describe "When I visit '/ingredients'" do
    it "displays list of all the ingredients including their name and cost" do
      visit "/ingredients"

      expect(page).to have_content(@ingred_1.name)
      expect(page).to have_content(@ingred_1.cost)
      expect(page).to have_content(@ingred_2.name)
      expect(page).to have_content(@ingred_2.cost)
      expect(page).to have_content(@ingred_3.name)
      expect(page).to have_content(@ingred_3.cost)
      expect(page).to have_content(@ingred_4.name)
      expect(page).to have_content(@ingred_4.cost)
    end
  end
end