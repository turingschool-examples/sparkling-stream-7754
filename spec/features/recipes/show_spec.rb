require "rails_helper"

RSpec.describe Recipe, type: :feature do
  it "As a visitor,
  When I visit '/recipes/:id',
  Then I see the recipe's name, complexity and genre,
  and I see a list of the names of the ingredients for the recipe." do
    recipe = Recipe.create(name: "Classic Beef", complexity: "Easy", genre: "Quick and easy foods")
    ingredient_1 = recipe.ingredients.create(name: "Salt", cost: 4)
    ingredient_2 = recipe.ingredients.create(name: "Ground beef", cost: 2)

    visit "/recipes/#{recipe.id}"

    expect(page).to have_content(recipe.name)
    expect(page).to have_content(recipe.complexity)
    expect(page).to have_content(recipe.genre)
    expect(page).to have_content(ingredient_1.name)
    expect(page).to have_content(ingredient_2.name)
  end
end