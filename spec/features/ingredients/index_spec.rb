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
    end
  end
end