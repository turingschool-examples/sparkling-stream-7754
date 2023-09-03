require "rails_helper"

RSpec.describe "recipes show" do
  it "list recipes with there attributes" do
    apple_bread = Recipe.create!(name: "Apple Bread", complexity: 1, genre: "snack")
    black_cloves = Recipe.create!(name: "Black cloves", complexity: 2, genre: "breakfast")

    apple_butter = Ingredient.create!(name: "apple butter", cost: 2)
    bread = Ingredient.create!(name: "bread", cost: 4)
    clove = Ingredient.create!(name: "clove", cost: 8)

    RecipeIngredient.create!(recipe: apple_bread, ingredient: apple_butter)
    RecipeIngredient.create!(recipe: apple_bread, ingredient: bread)
    RecipeIngredient.create!(recipe: black_cloves, ingredient: clove)

    visit "/recipes/#{apple_bread.id}"

    expect(page).to have_content("Apple Bread")
    expect(page).to have_content("apple butter")
    expect(page).to have_content("bread")
    expect(page).to_not have_content("Black Cloves")
    expect(page).to_not have_content("clove")
  end

  it "list recipes with there attributes" do
    apple_bread = Recipe.create!(name: "Apple Bread", complexity: 1, genre: "snack")
    black_cloves = Recipe.create!(name: "Black cloves", complexity: 2, genre: "breakfast")

    apple_butter = Ingredient.create!(name: "apple butter", cost: 2)
    bread = Ingredient.create!(name: "bread", cost: 4)
    clove = Ingredient.create!(name: "clove", cost: 8)

    RecipeIngredient.create!(recipe: apple_bread, ingredient: apple_butter)
    RecipeIngredient.create!(recipe: apple_bread, ingredient: bread)
    RecipeIngredient.create!(recipe: black_cloves, ingredient: clove)
    
    visit "/recipes/#{apple_bread.id}"
    
    expect(page).to have_content("6")
  end
  
  it "allows existing ingrediants to be added to recipes" do
    apple_bread = Recipe.create!(name: "Apple Bread", complexity: 1, genre: "snack")
    black_cloves = Recipe.create!(name: "Black cloves", complexity: 2, genre: "breakfast")
  
    apple_butter = Ingredient.create!(name: "apple butter", cost: 2)
    bread = Ingredient.create!(name: "bread", cost: 4)
    clove = Ingredient.create!(name: "clove", cost: 8)
  
    RecipeIngredient.create!(recipe: apple_bread, ingredient: apple_butter)
    RecipeIngredient.create!(recipe: apple_bread, ingredient: bread)
    RecipeIngredient.create!(recipe: black_cloves, ingredient: clove)

    visit "/recipes/#{apple_bread.id}"
    fill_in "Add ingredient", with: "clove"
    click_on "Add"

    expect(page).to have_content("clove")
  end

end