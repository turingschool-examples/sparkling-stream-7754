require 'rails_helper'

RSpec.describe "recipes show page", type: :feature do
  describe "As a visitor" do
    describe "when I visit /recipes/:id" do
      before(:each) do
        @onion = Ingredient.create!(name: "Onion", cost: 1)
        @tomato = Ingredient.create!(name: "Tomato", cost: 1)
        @egg = Ingredient.create!(name: "Egg", cost: 2)
        @shakshuka = Recipe.create!(name: "Shakshuka", complexity: 2, genre: "Breakfast")
        RecipeIngredient.create!(recipe_id: @shakshuka.id, ingredient_id: @tomato.id)
        RecipeIngredient.create!(recipe_id: @shakshuka.id, ingredient_id: @onion.id)
        RecipeIngredient.create!(recipe_id: @shakshuka.id, ingredient_id: @egg.id)
      end
      it "Then I see the recipe's name complexity and genre, 
      and a list of name of the ingredients for the recipe" do
        

        visit "/recipes/#{@shakshuka.id}"

        expect(page).to have_content(@shakshuka.name)
        expect(page).to have_content(@shakshuka.complexity)
        expect(page).to have_content(@shakshuka.genre)

        expect(page).to have_content(@onion.name)
        expect(page).to have_content(@tomato.name)
        expect(page).to have_content(@egg.name)
      end

      it "I see the total cost of all the ingredients in the recipe" do
        
        visit "/recipes/#{@shakshuka.id}"

        expect(page).to have_content(@onion.cost + @tomato.cost + @egg.cost)
      end

      it "I see a form to add an ingredient to the recipe, when I fill in the form
      and click submit I am redirected to the recipe show page with new ingredient listed" do
        ingredient = Ingredient.create!(name: "Garlic", cost: 1)
        visit "/recipes/#{@shakshuka.id}"

        fill_in "ingredient_id", with: ingredient.id
        click_button "Submit"

        expect(page).to have_content(ingredient.name)
      end
    end
  end
end