require "rails_helper"

RSpec.describe "resident index" do
  describe "User Story 2 - Recipes Show

  As a visitor,
  When I visit '/recipes/:id',
  Then I see the recipe's name, complexity and genre,
  and I see a list of the names of the ingredients for the recipe." do

          it "get Show" do
            #arrange
            recipe_1 = Recipe.create(name:"Ham Sandwich", complexity:1, genre:"Sandwich")
            recipe_1.ingredients.create!(name:"Bread", cost:2)
            recipe_1.ingredients.create!(name:"Ham", cost:4)
            recipe_1.ingredients.create!(name:"Cheese", cost:2)
            
            #act
            visit "/recipes/#{recipe_1.id}"
            #assert
            expect(page).to have_content("Ham Sandwich")
            expect(page).to have_content("Bread")
            expect(page).to have_content("Ham")
            expect(page).to have_content("Cheese")
          end
        end

        describe "User Story 3 - Total Cost

        As a visitor,
        When I visit '/recipes/:id'
        I see the total cost of all of the ingredients in the recipe.
        (e.g. Total Cost: 22)" do

          it "get Total cost" do
            #arrange
            recipe_1 = Recipe.create(name:"Ham Sandwich", complexity:1, genre:"Sandwich")
            recipe_1.ingredients.create!(name:"Bread", cost:2)
            recipe_1.ingredients.create!(name:"Ham", cost:4)
            recipe_1.ingredients.create!(name:"Cheese", cost:2)
            
            #act
            visit "/recipes/#{recipe_1.id}"
            #assert
            expect(page).to have_content("Ham Sandwich")
            expect(page).to have_content("Bread")
            expect(page).to have_content("Ham")
            expect(page).to have_content("Cheese")
            expect(page).to have_content("Total Cost: #{8}")
          end
        end
end