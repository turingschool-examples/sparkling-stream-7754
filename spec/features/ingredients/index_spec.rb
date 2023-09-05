require 'rails_helper'

RSpec.describe "Ingredients Index", type: :feature do
  describe "When I visit /ingredients" do
    it "I see a list of all ingredients including their name and cost" do
      ingredient_1 = Ingredient.create!(name: "Ground Beef", cost: 2)
      ingredient_2 = Ingredient.create!(name: "Salt", cost: 4)

      visit "/ingredients"

      expect(page).to have_content("#{ingredient_1.name}: #{ingredient_1.cost}")
      expect(page).to have_content("#{ingredient_2.name}: #{ingredient_2.cost}")
    end
  end
end