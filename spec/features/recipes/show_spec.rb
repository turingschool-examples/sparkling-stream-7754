require "rails_helper"

RSpec.describe "recipe show" do
  before :each do
    @bolognese_recipe = Recipe.create!(name: "Bolognese", complexity: 3, genre: "Italian")
    @beef = Ingredient.create!(name: "Beef", cost: 4)
    @pasta = Ingredient.create!(name: "Pasta", cost: 1)
    @mushrooms = Ingredient.create!(name: "Pasta", cost: 1)
    @recipe_ingredients_1 = RecipeIngredient.create!(recipe_id: "#{@bolognese_recipe.id}", ingredient_id:"#{@beef.id}")
    @recipe_ingredients_1 = RecipeIngredient.create!(recipe_id: "#{@bolognese_recipe.id}", ingredient_id:"#{@pasta.id}")
  end

  describe "#show" do
    it "displays the recipe name, complexity, genre, and ingredients" do
      visit "/recipes/#{@bolognese_recipe.id}"

      expect(page).to have_content(@bolognese_recipe.name)
      expect(page).to have_content(@bolognese_recipe.complexity)
      expect(page).to have_content(@bolognese_recipe.genre)
      
      expect(page).to have_content("Ingredients:")
      expect(page).to have_content(@beef.name)
      expect(page).to have_content(@pasta.name)
    end

    it "displays the total cost of the recipe" do
      visit "/recipes/#{@bolognese_recipe.id}"

      expect(page).to have_content("Total Cost: 5")
    end

    it "adds an ingredient to the recipe via a form" do
      visit "/recipes/#{@bolognese_recipe.id}"

      fill_in :ingredient_id, with: @mushrooms.id
      click_button "Add ingredient"

      expect(current_path).to eq("/recipes/#{@bolognese_recipe.id}")
      expect(page).to have_content(@mushrooms.name)
    end
  end
end