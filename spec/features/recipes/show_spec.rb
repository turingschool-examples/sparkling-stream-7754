require 'rails_helper'

RSpec.describe 'Show page', type: :feature do
  before(:each) do
    @recipe_1 = Recipe.create!(name: 'Burrito Bowl', complexity: 2, genre: 'Latin')
    @ingredient_1 = Ingredient.create!(name: 'Rice', cost: 4)
    @ingredient_2 = Ingredient.create!(name: 'Chicken', cost: 7)
    @ingredient_3 = Ingredient.create!(name: 'Avocado', cost: 1)
    @recipe_ingredient_1 = RecipeIngredient.create!(recipe_id: @recipe_1.id, ingredient_id: @ingredient_1.id)
    @recipe_ingredient_2 = RecipeIngredient.create!(recipe_id: @recipe_1.id, ingredient_id: @ingredient_2.id)
    @recipe_ingredient_3 = RecipeIngredient.create!(recipe_id: @recipe_1.id, ingredient_id: @ingredient_3.id)
  end
  
  describe 'As a visitor' do
    describe 'When I visit the recipes show page' do
      it 'I see the recipes name, complexity and genre' do

        visit "/recipes/#{@recipe_1.id}"
        
        expect(page).to have_content(@recipe_1.name)
        expect(page).to have_content(@recipe_1.complexity)
        expect(page).to have_content(@recipe_1.genre)
      end
    end
  end

  describe 'As a visitor' do
    describe 'When I visit the recipes show page' do
      it 'I also see the names of the recipe ingredients as a list' do
        
        visit "/recipes/#{@recipe_1.id}"
        
        expect(page).to have_content(@ingredient_1.name)
        expect(page).to have_content(@ingredient_2.name)
        expect(page).to have_content(@ingredient_3.name)
      end
    end
  end

  describe 'As a visitor' do
    describe 'When I visit the recipes show page' do
      xit 'I also see the total cost of all the ingredients in the recipe' do
        total_cost = @recipe_1.ingredients.sum(:cost)

        visit "/recipes/#{@recipe_1.id}"
        
        expect(page).to have_text("Total Cost: $#{total_cost}", type: :visible)
      end
    end
  end
end
  