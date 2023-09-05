require "rails_helper"

RSpec.describe "the Recipes show page" do
   it "should show a recipe's name, complexity and genre" do
      ingredient1 = Ingredient.create(name: "Apple", cost: 1)
      ingredient2 = Ingredient.create(name: "Pie Crust", cost: 2)
      ingredient3 = Ingredient.create(name: "Pie Filling", cost: 2)
      recipe1 = Recipe.create(name: "Apple Pie", complexity: "Easy", genre: "Baking")
      visit "/recipes/#{recipe1.id}"

      expect(page).to have_content("Applie Pie")
      expect(page).to have_content("Complexity: Easy")
      expect(page).to have_content("Genre: Baking")
   end

   xit "should show a recipe's name, complexity and genre" do
    ingredient1 = Ingredient.create(name: "Apple", cost: 1)
    ingredient2 = Ingredient.create(name: "Pie Crust", cost: 2)
    ingredient3 = Ingredient.create(name: "Pie Filling", cost: 2)

   end
end