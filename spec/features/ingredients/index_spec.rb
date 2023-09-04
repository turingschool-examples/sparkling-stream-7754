require 'rails_helper'

RSpec.describe "Ingredients Index", type: :feature do
  describe "As a visitor" do
    describe "When I visit /ingredients" do
      before(:each) do
        @onion = Ingredient.create!(name: "Onion", cost: 1)
        @tomato = Ingredient.create!(name: "Tomato", cost: 1)
        @pepper = Ingredient.create!(name: "Bell Pepper", cost: 2)
      end
      
      it "I see a list of all the ingredients including their name and cost" do
  
        visit '/ingredients'

        expect(page).to have_content(@onion.name)
        expect(page).to have_content(@onion.cost)
        expect(page).to have_content(@tomato.name)
        expect(page).to have_content(@tomato.cost)
        expect(page).to have_content(@pepper.name)
        expect(page).to have_content(@pepper.cost)
      end

      it "I see the list of ingredients sorted alphabetically by name" do

        visit '/ingredients'

        expect(@pepper.name).to appear_before(@onion.name)
        expect(@pepper.name).to appear_before(@tomato.name)
        expect(@pepper.name).to appear_before(@tomato.name)
      end
    end
  end
end