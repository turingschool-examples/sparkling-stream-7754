require "rails_helper"

RSpec.describe "Ingredients Index",type: :feature do
  describe "as a visitor" do
    describe "when I visit '/ingredients'" do
      it "I see a list of all the ingredients including their name and cost" do
        pepper = Ingredient.create!(
          name: "Pepper",
          cost: 3
        )

        salt = Ingredient.create!(
          name: "Salt",
          cost: 4
        )

        ground_beef = Ingredient.create!(
          name: "Ground Beef",
          cost: 2
        )

        visit "/ingredients"

        expect(page).to have_content("Pepper: 3")
        expect(page).to have_content("Salt: 4")
        expect(page).to have_content("Ground Beef: 2")
      end
    end
  end
end