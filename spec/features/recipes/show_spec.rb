require 'rails_helper'

RSpec.describe "Recipes show page" do
    it "Shows recipes attributes and list of ingredients" do
        cookies = Recipe.create!(name: "Cookies", complexity: 2, genre: "Dessert")
        ingredient_1 = cookies.ingredients.create(name: 'Eggs', cost: 2)
        ingredient_2 = cookies.ingredients.create(name: 'Butter', cost: 4)
        ingredient_3 = cookies.ingredients.create(name: 'Chocolate Chips', cost: 5)

        visit "/recipes/#{cookies.id}"

        expect(page).to have_content(cookies.name)
        expect(page).to have_content(cookies.complexity)
        expect(page).to have_content(cookies.genre)
        expect(page).to have_content(ingredient_1.name)
        expect(page).to have_content(ingredient_2.name)
        expect(page).to have_content(ingredient_3.name)
    end

    it "Shows the cost of the recipe" do
        cookies = Recipe.create!(name: "Cookies", complexity: 2, genre: "Dessert")
        ingredient_1 = cookies.ingredients.create(name: 'Eggs', cost: 2)
        ingredient_2 = cookies.ingredients.create(name: 'Butter', cost: 4)
        ingredient_3 = cookies.ingredients.create(name: 'Chocolate Chips', cost: 5)

        visit "/recipes/#{cookies.id}"

        expect(page).to have_content("Total Cost: 11")
    end
end