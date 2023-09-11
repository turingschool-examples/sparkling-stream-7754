require "rails_helper"

RSpec.describe "recipes#show" do
  before(:each) do
    @recipe_1 = Recipe.create!(name: "Spaghetti", complexity: 3, genre: "Italian")
    @recipe_2 = Recipe.create!(name: "Burger", complexity: 1, genre: "American")

    @ingredient_1 = Ingredient.create!(name: "Ground Beef", cost: 2)
    @ingredient_2 = Ingredient.create!(name: "Salt", cost: 4)
    @ingredient_3 = Ingredient.create!(name: "Noodles", cost: 1)
    @ingredient_4 = Ingredient.create!(name: "Tomatoes", cost: 2)
    @ingredient_5 = Ingredient.create!(name: "Burg Bun", cost: 1)

    @spaghetti_1 = RecipeIngredient.create!(recipe: @recipe_1, ingredient: @ingredient_1)
    @spaghetti_2 = RecipeIngredient.create!(recipe: @recipe_1, ingredient: @ingredient_2)
    @spaghetti_3 = RecipeIngredient.create!(recipe: @recipe_1, ingredient: @ingredient_3)
  end

  describe "display recipe info" do
    it "shows the recipe's name, complexity, and genre" do
      visit "/recipes/#{@recipe_1.id}"

      expect(page).to have_content("Name: #{@recipe_1.name}")
      expect(page).to have_content("Complexity: #{@recipe_1.complexity}")
      expect(page).to have_content("Genre: #{@recipe_1.genre}")
    end

    # User Story 2 - Recipes Show

    # As a visitor,
    # When I visit '/recipes/:id',
    # Then I see the recipe's name, complexity and genre,
    # and I see a list of the names of the ingredients for the recipe.


    it "shows a list of the names of the ingredients for the recipe" do
      visit "/recipes/#{@recipe_1.id}"

      expect(page).to have_content(@ingredient_1.name)
      expect(page).to have_content(@ingredient_2.name)
      expect(page).to have_content(@ingredient_3.name)
    end

    it "has a form to add an existing ingredient ot the recipe" do
      visit "/recipes/#{@recipe_1.id}"
      
      expect(page).to_not have_content(@ingredient_4.name)

      fill_in :ingredient_id, with: @ingredient_4.id

      click_button "Add Ingredient"

      expect(current_path).to eq("/recipes/#{@recipe_1.id}")
      expect(page).to have_content(@ingredient_4.name)
    end
   
  end
end
