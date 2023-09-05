require 'rails_helper'

RSpec.describe 'Index page', type: :feature do
  before(:each) do
    @ingredient_1 = Ingredient.create(name: 'Rice', cost: 4)
    @ingredient_2 = Ingredient.create(name: 'Chicken', cost: 7)
    @ingredient_3 = Ingredient.create(name: 'Avocado', cost: 1)
  end
  
  describe 'As a visitor' do
    describe 'When I visit the ingredients index page' do
      it 'I see the names of all ingredients listed' do

        visit '/ingredients'

        expect(page).to have_content(@ingredient_1.name)
        expect(page).to have_content(@ingredient_2.name)
        expect(page).to have_content(@ingredient_3.name)
      end
    end
  end

  describe 'As a visitor' do
    describe 'When I visit the ingredients index page' do
      it 'I see that the list of ingredients is sorted alphabetically by name' do
          
          visit '/ingredients'
  
          expect(@ingredient_3.name).to appear_before(@ingredient_2.name)
          expect(@ingredient_2.name).to appear_before(@ingredient_1.name)
        end
      end
    end
end
  