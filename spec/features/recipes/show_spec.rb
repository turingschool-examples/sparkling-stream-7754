require 'rails_helper'

RSpec.describe "Recipes Show" do
  it "Display a recipe's name, complexity and genre, and I see a list of the names of the ingredients for the recipe." do

    @recipe = Recipe.create!( name: "Taco Meat", complexity: 10, genre: "Mexican")
    @ingredient_1 = Ingredient.create!(name: "Ground Beef", cost: 2)
    @ingredient_2 = Ingredient.create!(name: "Salt", cost: 4)
   
    @recipe.ingredients << [@ingredient_1, @ingredient_2]

    visit "/recipes/#{@recipe.id}"

    expect(page).to have_content(@recipe.name)
    expect(page).to have_content(@recipe.complexity)
    expect(page).to have_content(@recipe.genre)


    expect(page).to have_content("List of Ingredients for recipe")
    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(@ingredient_2.name)
  end
end