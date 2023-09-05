require "rails_helper"

RSpec.describe "the Ingredients index page" do
   it "should show a list of all the ingredients including their name and cost" do
      ingredient1 = Ingredient.create(name: "Apple", cost: 1)
      visit "/ingredients"
      
      expect(page).to have_content("Apple: 1")
   end
end