require "rails_helper"

RSpec.describe "the ingredients index page" do
  describe "As a visitor" do
    describe "When I visit '/ingredients" do
      it "I see a list of all ingredients including name and cost" do
        ingredient1 = Ingredient.create!(name: "Sugar", cost: 3)
        ingredient2 = Ingredient.create!(name: "Flour", cost: 1)
        ingredient3 = Ingredient.create!(name: "Salt", cost: 2)

        visit "/ingredients"

        within("#item-#{ingredient1.id}") do
          expect(page).to have_content(ingredient1.name)
          expect(page).to have_content(ingredient1.cost)
        end

        within("#item-#{ingredient2.id}") do
          expect(page).to have_content(ingredient2.name)
          expect(page).to have_content(ingredient2.cost)
        end

        within("#item-#{ingredient3.id}") do
          expect(page).to have_content(ingredient3.name)
          expect(page).to have_content(ingredient3.cost)
        end
      end
    end
  end
end