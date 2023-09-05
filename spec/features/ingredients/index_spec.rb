require "rails_helper"

RSpec.describe "Ingredients index page", type: :feature do
  before :each do 
    @ingredient1 = Ingredient.create!(name: "Tofu", cost: 4) 
    @ingredient2 = Ingredient.create!(name: "Vegan Motzerella", cost: 2) 
    @ingredient3 = Ingredient.create!(name: "Fresh Herbs", cost: 3) 
  end

  describe "As a visitor to /ingredients" do 
    it "Shows a list of all ingredients and price" do 
      visit '/ingredients'

      expect(page).to have_content("Tofu")
      expect(page).to have_content("Vegan Motzerella")
      expect(page).to have_content("Fresh Herbs")
      expect(page).to have_content(4)
      expect(page).to have_content(2)
      expect(page).to have_content(3)
    end
  end
end