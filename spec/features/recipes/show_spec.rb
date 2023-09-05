require 'rails_helper'

RSpec.describe "Recipes Show" type: :feature do
  it "Display a recipe's name, complexity and genre, and I see a list of the names of the ingredients for the recipe." do

    @recipe_1 = Recipe.create!( name: "Taco Meat", complexity: 10, genre: "Mexican")
    @ingredient_1 = Ingredient.create!(name: "Ground Beef", cost: 2)
    @ingredient_2 = Ingredient.create!(name: "Salt", cost: 4)
   
    @recipe_1.ingredients << [@ingredient_1, @ingredient_2]

    visit "/recipes/#{recipe.id}"

    expect(page).to have_content(@recipe_1.name)
    expect(page).to have_content(@recipe_1.complexity)
    expect(page).to have_content(@recipe_1.genre)


    expect(page).to have_content("List of Ingredients for recipe")
    expect(page).to have_content("Ground Beef")
    expect(page).to have_content("Salt")
  end
end

User Story 2 - Recipes Show

As a visitor,
When I visit '/recipes/:id',
Then I see the recipe's name, complexity and genre,
and I see a list of the names of the ingredients for the recipe.
