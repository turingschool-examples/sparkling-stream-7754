require "rails_helper"

RSpec.describe "Ingredients Index Page" do
  describe "As a visitor" do
    describe "When I visit '/ingredients'" do
      it "displays a list of all the ingredients including their name and cost" do
        ground_beef = Ingredient.create!(name: "Ground Beef", cost: 2)
        salt = Ingredient.create!(name: "Salt", cost: 4)

        visit "/ingredients"

        expect(page).to have_content("All Ingredients")
        expect(page).to have_content("#{ground_beef.name}: #{ground_beef.cost}")
        expect(page).to have_content("#{salt.name}: #{salt.cost}")
      end

      it "displays the list of ingredients in alphabetical order by name" do
        ground_beef = Ingredient.create!(name: "Ground Beef", cost: 2)
        salt = Ingredient.create!(name: "Salt", cost: 4)
        eggs = Ingredient.create!(name: "Eggs", cost: 3)
        milk = Ingredient.create!(name: "Milk", cost: 2)
        flour = Ingredient.create!(name: "Flour", cost: 5)

        visit "/ingredients"

        expect(eggs.name).to appear_before(flour.name)
        expect(flour.name).to appear_before(ground_beef.name)
        expect(ground_beef.name).to appear_before(milk.name)
        expect(milk.name).to appear_before(salt.name)
      end
    end
  end
end