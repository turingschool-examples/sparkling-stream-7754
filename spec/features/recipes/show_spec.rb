require "rails_helper"

RSpec.describe "the /recipes/:id show page" do
  describe "When I visit /recipes/:id" do
    before :each do
      @recipe_1 = Recipe.create!(name: "Lasagna", complexity: 2, genre: "Italian")

      @ingredient_1 = Ingredient.create!(name: "Pasta", cost: 2)
      @ingredient_2 = Ingredient.create!(name: "Cheese", cost: 4)
      @ingredient_3 = Ingredient.create!(name: "Sauce", cost: 3)

      RecipeIngredient.create!(recipe: @recipe_1, ingredient: @ingredient_1)
      RecipeIngredient.create!(recipe: @recipe_1, ingredient: @ingredient_2)
      RecipeIngredient.create!(recipe: @recipe_1, ingredient: @ingredient_3)
    end

    # User Story 2
    it "shows the name, complexity and genre of recipe" do
      visit "/recipes/#{@recipe_1.id}"

      expect(page).to have
    end

    # User Story 2
    xit "displays recipe's: name, complexity, genre and ingredient list" do
      visit "/recipes/#{@recipe.id}"

      expect(page).to havecontent("Name: #recipe_1.name")
      expect(page).to havecontent("Genre: #recipe_1.genre")
      expect(page).to havecontent("Complexity: #complexnity")

      expect(pageP).to have conent = Ingredient_1
      expect(pageP).to have conent = Ingredient_2
      expect(pageP).to have conent = Ingredient_3
      expect(pageP).to have conent = Ingredient_4
      
    end
  end
end