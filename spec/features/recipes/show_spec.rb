require 'rails_helper'

RSpec.describe "Recipes Show" do
  before(:each) do
    @recipe_1 = Recipe.create!(name: "Oops, all Beef!", complexity: 1, genre: "Horrible")
    @recipe_2 = Recipe.create!(name: "Literally Potatoes", complexity: 2, genre: "Rustic")
    @ingredient_1 = @recipe_1.ingredients.create!(name: "Ground Beef", cost: 2)
    @ingredient_2 = @recipe_1.ingredients.create!(name: "Salt", cost: 4)
    @ingredient_3 = @recipe_2.ingredients.create!(name: "Potato", cost: 1)
  end

  describe "When I visit /recipes/:id" do
    it "I see the recipe's name, complexity and genre" do
      visit "/recipes/#{@recipe_1.id}"

      expect(page).to have_content(@recipe_1.name)
      expect(page).to have_content("Complexity: #{@recipe_1.complexity}")
      expect(page).to have_content(@recipe_1.genre)
    end

    it "I see a list of the names of the ingredients for the recipe" do
      visit "/recipes/#{@recipe_1.id}"

      expect(page).to have_content(@ingredient_1.name)
      expect(page).to have_content(@ingredient_2.name)
      expect(page).to_not have_content(@ingredient_3.name)

      visit "/recipes/#{@recipe_2.id}"

      expect(page).to have_content(@ingredient_3.name)
    end
  end
end