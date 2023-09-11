require "rails_helper"

RSpec.describe "recipes#show" do
  before(:each) do
    @recipe_1 = Recipe.create!(name: "Spaghetti", complexity: 3, genre: "Italian")
    @recipe_2 = Recipe.create!(name: "Burger", complexity: 1, genre: "American")
  end

  describe "display recipe info" do
    it "shows the recipe's name, complexity, and genre" do
      visit "/recipes/#{@recipe_1.id}"

      expect(page).to have_content(@recipe_1.name)
      expect(page).to have_content(@recipe_1.complexity)
      expect(page).to have_content(@recipe_1.genre)


    end
  end
end
