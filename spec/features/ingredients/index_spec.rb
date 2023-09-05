require "rails_helper"

  RSpec.describe "Ingredients Index" do
  before(:each) do
    ingredient_1 = Ingredient.create(name: "pepper", cost: 3)
    ingredient_2 = Ingredient.create(name: "salt", cost: 2)
  end

  describe "When I visit '/ingredients'" do
    it "I see a list of all the ingredients including their name and cost" do
      visit "/ingredients"
      
      expect(page).to have_content("pepper")
      expect(page).to have_content(3)
      expect(page).to have_content("salt")
      expect(page).to have_content(2)

    end
  end
end

