require "rails_helper"

RSpec.describe "the recipe show page" do
  describe "As a visitor" do
    describe "When I visit '/recipes/:id" do
      before :each do
        @ingredient1 = Ingredient.create!(name: "Sugar", cost: 3)
        @ingredient2 = Ingredient.create!(name: "Flour", cost: 1)
        @ingredient3 = Ingredient.create!(name: "Salt", cost: 2)
        @recipe1 = Recipe.create!(name: "Cookies", complexity: 2, genre: "Baked Goods")
        @recipe2 = Recipe.create!(name: "Coffee", complexity: 1, genre: "Drink")
        @recipe3 = Recipe.create!(name: "Soup", complexity: 3, genre:"Hot Bowl")
        RecipeIngredient.create!(recipe: @recipe1, ingredient: @ingredient1)
        RecipeIngredient.create!(recipe: @recipe1, ingredient: @ingredient2)
        RecipeIngredient.create!(recipe: @recipe2, ingredient: @ingredient1)
        RecipeIngredient.create!(recipe: @recipe3, ingredient: @ingredient3)
      end

      it "I see the recipe name, complexity, and genre, and list of ingredient names" do
        visit "recipes/#{@recipe1.id}"

        expect(page).to have_content(@recipe1.name)
        expect(page).to have_content(@recipe1.complexity)
        expect(page).to have_content(@recipe1.genre)

        within("#ingredients") do
          expect(page).to have_content(@ingredient1.name)
          expect(page).to have_content(@ingredient2.name)
        end
      end
    end
  end
end
