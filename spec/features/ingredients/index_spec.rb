require "rails_helper"

RSpec.feature 'ingredients index page' do
  describe 'when visiting /ingredients' do
    scenario 'US1 see a list of all ingredients with name and cost' do
      flour = Ingredient.create!(name: 'Flour', cost: 1)
      eggs = Ingredient.create!(name: 'Eggs', cost: 2)
      milk = Ingredient.create!(name: 'Milk', cost: 3)

      visit '/ingredients'

      expect(page).to have_content(flour.name)
      expect(page).to have_content(flour.cost)
      expect(page).to have_content(eggs.name)
      expect(page).to have_content(eggs.cost)
      expect(page).to have_content(milk.name)
      expect(page).to have_content(milk.cost)
    end
  end
end
