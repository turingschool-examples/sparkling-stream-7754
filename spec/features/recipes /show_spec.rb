require "rails_helper"

RSpec.describe "Recipes show page" do 
  before :each do 
    @recipe1 = Recipe.create!(name: "Blakes Dish", complexity: 3, genre: "Vegan") 
    @recipe2 = Recipe.create!(name: "Grandmas Bread", complexity: 4, genre: "From-Scratch")
    @recipe3 = Recipe.create!(name: "Grandpas Beans", complexity: 3, genre: "Rustic")

    @ingredient1 = Ingredient.create!(name: "Onions", cost: 4) 
    @ingredient2 = Ingredient.create!(name: "Yeast", cost: 2) 
    @ingredient3 = Ingredient.create!(name: "Beans", cost: 3) 

    @rec_ingred1 = RecipeIngredient.create!(recipe_id: @recipe3, ingredient_id: @ingredient1) 
    @rec_ingred2 = RecipeIngredient.create!(recipe_id: @recipe3, ingredient_id: @ingredient3) 
    @rec_ingred3 = RecipeIngredient.create!(recipe_id: @recipe2, ingredient_id: @ingredient2) 
  end

  describe "As a visitor to /recipes/:id" do 
    it "Shows the recipes with that id including attributes and ingredients" do 
      visit "/recipes/#{@recipe3.id}"

      expect(page).to have_content("Grandpas Beans")
      expect(page).to have_content(3)
      expect(page).to have_content("Rustic")
      expect(page).to have_content(@ingredient1.name)
      expect(page).to have_content(@ingredient3.name)
    end
  end
end