require "rails_helper"

RSpec.feature 'recipes show page' do
  describe 'when visiting /recipes/:id' do
    scenario 'US2 see a list of recipe details and required ingredients' do
      recipe = Recipe.create!(name: 'Omlette', complexity: 1, genre: 'Breakfast')
      cheese = Ingredient.create!(name: 'Cheese', cost: 1)
      eggs = Ingredient.create!(name: 'Eggs', cost: 2)
      bacon = Ingredient.create!(name: 'Bacon', cost: 3)
      RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: cheese.id)
      RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: eggs.id)
      RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: bacon.id)

      visit "/recipes/#{recipe.id}"

      expect(page).to have_content(recipe.name)
      expect(page).to have_content(recipe.complexity)
      expect(page).to have_content(recipe.genre)
      expect(page).to have_content(cheese.name)
      expect(page).to have_content(eggs.name)
      expect(page).to have_content(bacon.name)
    end

    scenario 'US3 see total cost of ingredients for recipe' do
      recipe = Recipe.create!(name: 'Omlette', complexity: 1, genre: 'Breakfast')
      cheese = Ingredient.create!(name: 'Cheese', cost: 1)
      eggs = Ingredient.create!(name: 'Eggs', cost: 2)
      bacon = Ingredient.create!(name: 'Bacon', cost: 3)
      RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: cheese.id)
      RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: eggs.id)
      RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: bacon.id)

      visit "/recipes/#{recipe.id}"

      expect(page).to have_content("Total Cost: 6")
    end

    scenario 'EXT5 shows a form to add ingredient by ID' do
      recipe = Recipe.create!(name: 'Omlette', complexity: 1, genre: 'Breakfast')
      cheese = Ingredient.create!(name: 'Cheese', cost: 1)
      eggs = Ingredient.create!(name: 'Eggs', cost: 2)
      bacon = Ingredient.create!(name: 'Bacon', cost: 3)
      RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: cheese.id)
      RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: eggs.id)
      RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: bacon.id)

      visit "/recipes/#{recipe.id}"

      expect(page).to have_content("Add Ingredient")
      expect(page).to have_content("Ingredient ID:")

      fill_in :ingredient_id, with: "#{cheese.id}"
      click_button "Add Ingredient"
      expect(current_path).to eq("/recipes/#{recipe.id}")
      expect(page).to have_content(cheese.name), count: 2
    end
  end
end