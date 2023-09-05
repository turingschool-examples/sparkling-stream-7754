require "rails_helper"

RSpec.describe "Ingredients index page", type: :feature do
  before :each do 
    @ingredient1 = Ingredient.create!(name: "Onions", cost: 4) 
    @ingredient2 = Ingredient.create!(name: "Yeast", cost: 2) 
    @ingredient3 = Ingredient.create!(name: "Beans", cost: 3) 
  end

  describe "As a visitor to /ingredients" do 
    it "Shows a list of all ingredients and price" do 
      visit '/ingredients'

      expect(page).to have_content("Onions")
      expect(page).to have_content("Yeast")
      expect(page).to have_content("Beans")
      expect(page).to have_content(4)
      expect(page).to have_content(2)
      expect(page).to have_content(3)
    end
  end
end