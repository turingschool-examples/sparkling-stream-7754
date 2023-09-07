require "rails_helper"

RSpec.describe "Ingredients Index" do 
  describe "as a visitor" do 
    before(:each) do
    @ingredient_1 = Ingredient.create!(name: "Ground Beef", cost: 2)
    @ingredient_2 = Ingredient.create!(name: "Salt", cost: 4)
    end

    # User Story 1
    it "displays a list of all ingredients and attributes" do
      visit '/ingredients' 

      expect(page).to have_content("#{@ingredient_1.name}: #{@ingredient_1.cost}")
      expect(page).to have_content("#{@ingredient_2.name}: #{@ingredient_2.cost}")
    end
  end
end