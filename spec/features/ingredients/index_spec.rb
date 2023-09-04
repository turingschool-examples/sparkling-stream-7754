require 'rails_helper'

RSpec.describe "Ingredients Index" do
  describe "As a visitor" do
    describe "When I visit /ingredients" do
      it "I see a list of all the ingredients including their name and cost" do
        onion = Ingredient.create!(name: "Onion", cost: 1)
        tomato = Ingredient.create!(name: "Tomato", cost: 1)
        pepper = Ingredient.create!(name: "Bell Pepper", cost: 2)

        visit '/ingredients'

        expect(page).to have_content(onion.name)
        expect(page).to have_content(onion.cost)
        expect(page).to have_content(tomato.name)
        expect(page).to have_content(tomato.cost)
        expect(page).to have_content(pepper.name)
        expect(page).to have_content(pepper.cost)
      end
    end
  end
end