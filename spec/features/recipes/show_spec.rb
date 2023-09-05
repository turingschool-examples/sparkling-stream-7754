require "rails_helper"

RSpec.describe "recipe show page" do
  it "displays the recipe's name, complexity, and genre, along with all of its ingredients" do
    recipe = Recipe.create(name: "Salted Grounded Beef", complexity: 1, genre: "meat")
    ingredient_1 = recipe.ingredients.create(name: "Ground Beef", cost: 2)
    ingredient_2 = recipe.ingredients.create(name: "Salt", cost: 4)

    visit "/recipes/#{recipe.id}"
    save_and_open_page

    expect(page).to have_content(recipe.name)
    expect(page).to have_content(recipe.complexity)
    expect(page).to have_content(recipe.genre)
    expect(page).to have_content(ingredient_1.name)
    expect(page).to have_content(ingredient_2.name)
  end
end