require "rails_helper"

RSpec.describe "the Recipes show page" do
  it "should show a recipe's name, complexity and genre" do
    ingredient1 = Ingredient.create(name: "Apple", cost: 1)
    ingredient2 = Ingredient.create(name: "Pie Crust", cost: 2)
    ingredient3 = Ingredient.create(name: "Pie Filling", cost: 2)
    recipe1 = Recipe.create(name: "Apple Pie", complexity: 3, genre: "Baking")
    visit "/recipes/#{recipe1.id}"

    expect(page).to have_content("Apple Pie")
    expect(page).to have_content("Complexity: 3 out of 10")
    expect(page).to have_content("Genre: Baking")
  end

  it "should show a list of the ingredients for the recipe" do
    ingredient1 = Ingredient.create(name: "Apple", cost: 1)
    ingredient2 = Ingredient.create(name: "Pie Crust", cost: 2)
    ingredient3 = Ingredient.create(name: "Pie Filling", cost: 2)
    recipe1 = Recipe.create(name: "Apple Pie", complexity: 3, genre: "Baking")
    recipe_ingredients1 = RecipeIngredient.create(ingredient_id: ingredient1.id, recipe_id: recipe1.id)
    recipe_ingredients2 = RecipeIngredient.create(ingredient_id: ingredient2.id, recipe_id: recipe1.id)
    recipe_ingredients3 = RecipeIngredient.create(ingredient_id: ingredient3.id, recipe_id: recipe1.id)
    visit "/recipes/#{recipe1.id}"

    expect(page).to have_content("Apple")
    expect(page).to have_content("Pie Crust")
    expect(page).to have_content("Pie Filling")
  end

  it "should show the total cost of all the ingredients for the recipe" do
    ingredient1 = Ingredient.create(name: "Apple", cost: 1)
    ingredient2 = Ingredient.create(name: "Pie Crust", cost: 2)
    ingredient3 = Ingredient.create(name: "Pie Filling", cost: 2)
    recipe1 = Recipe.create(name: "Apple Pie", complexity: 3, genre: "Baking")
    recipe_ingredients1 = RecipeIngredient.create(ingredient_id: ingredient1.id, recipe_id: recipe1.id)
    recipe_ingredients2 = RecipeIngredient.create(ingredient_id: ingredient2.id, recipe_id: recipe1.id)
    recipe_ingredients3 = RecipeIngredient.create(ingredient_id: ingredient3.id, recipe_id: recipe1.id)
    visit "/recipes/#{recipe1.id}"

    expect(page).to have_content("Total Cost: 5")
  end
end