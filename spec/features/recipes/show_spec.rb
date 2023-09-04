require "rails_helper"

RSpec.describe "Recipes Show",type: :feature do
  describe "as a visitor" do
    describe "when I visit '/recipes/:id" do
      it "I see the recipe's name, complexity and genre, and I see a list of the names of the ingredients for the recipe" do
        recipe_1 = Recipe.create!(
          name: "Mac and Cheese",
          complexity: "Easy",
          genre: "Comfort"
        )

        cheese = recipe_1.ingredients.create!(
          name: "Cheese",
          cost: "2"
        )

        noodles = recipe_1.ingredients.create!(
          name: "Noodles",
          cost: "6"
        )

        butter = recipe_1.ingredients.create!(
          name: "Butter",
          cost: "4"
        )

        milk = recipe_1.ingredients.create!(
          name: "Milk",
          cost: "5"
        )

        visit "/recipes/#{recipe_1.id}"

        expect(page).to have_content("#{recipe_1.name}")
        expect(page).to have_content("Complexity: #{recipe_1.complexity}")
        expect(page).to have_content("Genre: #{recipe_1.genre}")
        expect(page).to have_content("Ingredients:")
        expect(page).to have_content("Cheese")
        expect(page).to have_content("Noodles")
        expect(page).to have_content("Butter")
        expect(page).to have_content("Milk")
      end
    end
  end

  describe "as a visitor" do
    describe "when I visit '/recipes/:id/" do
      it "I see the total cost of all of the ingredients in the recipe" do
        recipe_1 = Recipe.create!(
          name: "Mac and Cheese",
          complexity: "Easy",
          genre: "Comfort"
        )

        cheese = recipe_1.ingredients.create!(
          name: "Cheese",
          cost: "2"
        )

        noodles = recipe_1.ingredients.create!(
          name: "Noodles",
          cost: "6"
        )

        butter = recipe_1.ingredients.create!(
          name: "Butter",
          cost: "4"
        )

        milk = recipe_1.ingredients.create!(
          name: "Milk",
          cost: "5"
        )

        visit "/recipes/#{recipe_1.id}"

        expect(page).to have_content("Total Cost: 17")
      end
    end
  end
end