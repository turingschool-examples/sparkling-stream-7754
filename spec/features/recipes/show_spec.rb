require "rails_helper"

RSpec.describe "the recipes show" do
  it "shows the recipe and all its atttributes" do
    recipe_1 = Recipe.create(name: "Cheesebruger", complexity: 3, genre: "Grilling", id: 1)
    beef = Ingredient.create(name: "Ground Beef", cost: 2)
    # cheese = Ingredient.create(name: "American Cheese", cost: 1)
    # bun = Ingredient.create(name: "Brioche Bun", cost: 3)

    visit "/recipes/"

    expect(page).to have_content(recipe_1.name)
    expect(page).to have_content(recipe_1.complexity)
    expect(page).to have_content(recipe_1.genre)


  end
end
