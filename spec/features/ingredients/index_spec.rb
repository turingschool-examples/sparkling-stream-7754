require "rails_helper"

RSpec.feature 'ingredients index page' do
  describe 'when visiting /ingredients' do
    scenario 'US1 see a list of all ingredients with name and cost' do
      cheese = Ingredient.create!(name: 'Cheese', cost: 1)
      eggs = Ingredient.create!(name: 'Eggs', cost: 2)
      bacon = Ingredient.create!(name: 'Bacon', cost: 3)

      visit '/ingredients'

      expect(page).to have_content(cheese.name)
      expect(page).to have_content(cheese.cost)
      expect(page).to have_content(eggs.name)
      expect(page).to have_content(eggs.cost)
      expect(page).to have_content(bacon.name)
      expect(page).to have_content(bacon.cost)
    end
    
    scenario 'EXT1 see a list of all ingredients sorted alphabetically' do 
      cheese = Ingredient.create!(name: 'Cheese', cost: 1)
      bacon = Ingredient.create!(name: 'Bacon', cost: 3)
      eggs = Ingredient.create!(name: 'Eggs', cost: 2)

      visit '/ingredients'

      expect(bacon.name).to appear_before(cheese.name)
      expect(cheese.name).to appear_before(eggs.name)
    end
  end
end
