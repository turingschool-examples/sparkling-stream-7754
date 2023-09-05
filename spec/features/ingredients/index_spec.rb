require "rails_helper"

RSpec.describe "the Ingredients index page" do
  it "should show a list of all the ingredients including their name and cost" do
     ingredient1 = Ingredient.create(name: "Apple", cost: 1)
     ingredient2 = Ingredient.create(name: "Pie Crust", cost: 2)
     ingredient3 = Ingredient.create(name: "Pie Filling", cost: 2)
     visit "/ingredients"

      expect(page).to have_content("Apple: 1")
   end
end