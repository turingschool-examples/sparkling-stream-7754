require "rails_helper"

  RSpec.describe "Recipes Show" do
  before(:each) do
    @recipe_1 = Recipe.create(name: "pie", complexity: 5, genre: "baked")

    @ingredient_1 = Ingredient.create(name: "pepper", cost: 3)
    @ingredient_2 = Ingredient.create(name: "salt", cost: 2)

    RecipeIngredient.create(recipe: @recipe_1, ingredient: @ingredient_1)
    RecipeIngredient.create(recipe: @recipe_1, ingredient: @ingredient_2)
  end

  describe "When I visit '/recipes/:id'" do
    it "I see a list of all the ingredients including their name and cost" do
      visit "/recipes/#{@recipe_1.id}"
      save_and_open_page
      expect(page).to have_content("pie")
      expect(page).to have_content(5)
      expect(page).to have_content("baked")

      expect(page).to have_content("Total Cost: 5")


    end
  end
end