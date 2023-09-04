require 'rails_helper'

RSpec.describe 'Ingredients index page' do
    it "displays a list of all the ingredients with name and cost" do
        ingredient_1 = Ingredient.create(name: 'Eggs', cost: 2)
        ingredient_2 = Ingredient.create(name: 'Butter', cost: 4)
        ingredient_3 = Ingredient.create(name: 'Chocolate Chips', cost: 5)

        visit "/ingredients"

        expect(page).to have_content(ingredient_1.name)
        expect(page).to have_content(ingredient_1.cost)
        expect(page).to have_content(ingredient_2.name)
        expect(page).to have_content(ingredient_2.cost)
        expect(page).to have_content(ingredient_3.name)
        expect(page).to have_content(ingredient_3.cost)
    end

end