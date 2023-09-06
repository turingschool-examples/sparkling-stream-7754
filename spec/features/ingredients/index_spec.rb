require "rails_helper"

RSpec.describe "Ingredients Index" do 
  describe "as a visitor" do 
    before(:each) do
      @ingredient_1 = Ingredient.create!(name: "Garlic", cost: 2)
      @ingredient_2 = Ingredient.create!(name: "Onion", cost: 1)
    end

    # User Story 1
    it "displays a list of all ingredients and attributes" do
      visit '/ingredients' 

      expect(page).to have_content(@ingredient_1.name)
      expect(page).to have_content(@ingredient_1.cost)
    end
  end
end