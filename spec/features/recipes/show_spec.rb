require 'rails_helper'

RSpec.describe "recipes show page" do
  describe "As a visitor" do
    describe "when I visit /recipes/:id" do
      it "Then I see the recipe's name complexity and genre, 
      and a list of name of the ingredients for the recipe" do
        onion = Ingredient.create!(name: "Onion", cost: 1)
        tomato = Ingredient.create!(name: "Tomato", cost: 1)
        egg = Ingredient.create!(name: "Egg", cost: 2)
        shakshuka = Recipe.create!(name: "Shakshuka", complexity: 2, genre: "Breakfast")
        RecipeIngredient.create(recipe_id: shakshuka, ingredient_id: tomato)
        RecipeIngredient.create(recipe_id: shakshuka, ingredient_id: onion)
        RecipeIngredient.create(recipe_id: shakshuka, ingredient_id: egg)

        visit "/recipes/#{shakshuka.id}"

        expect(page).to have_content(shakshuka.name)
        expect(page).to have_content(shakshuka.complexity)
        expect(page).to have_content(shakshuka.genre)

        expect(page).to have_content(onion.name)
        expect(page).to have_content(tomato.name)
        expect(page).to have_content(egg.name)
      end
    end
  end
end