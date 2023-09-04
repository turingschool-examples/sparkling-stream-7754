require "rails_helper"

RSpec.describe "the recipe show page" do
  it "shows a list of recipes and their ingredients" do
    ingredient_1 = Ingredient.create(name: "Pasta", cost: 2)
    ingredient_2 = Ingredient.create(name: "Pasta Sauce", cost: 4)
    recipe_1 = Recipe.create(name: "Spaghetti", complexity: 2, genre: "Italian")
    RecipeIngredient.create(recipe: recipe_1, ingredient: ingredient_1)
    RecipeIngredient.create(recipe: recipe_1, ingredient: ingredient_2)
    
    visit "/recipes/#{recipe_1.id}"

    expect(page).to have_content("Recipe: #{recipe_1.name}")
    expect(page).to have_content("Complexity: #{recipe_1.complexity}")
    expect(page).to have_content("Genre: #{recipe_1.genre}")
    expect(page).to have_content("Ingredients")
    expect(page).to have_content(ingredient_1.name)
    expect(page).to have_content(ingredient_2.name)
  end
end