require "rails_helper"

RSpec.describe "ingredients index" do 
  before :each do 
    @chicken = Ingredient.create!(name: "Chicken", cost: 5)
    @tortillas = Ingredient.create!(name: "Tortillas", cost: 2)
    @beef = Ingredient.create!(name: "Beef", cost: 4)
    @pasta = Ingredient.create!(name: "Pasta", cost: 1)
  end
  describe "#index" do 
    it "display name and cost of all ingredients" do 
      visit "/ingredients"

      expect(page).to have_content("All Ingredients Available")

      expect(page).to have_content(@chicken.name)
      expect(page).to have_content(@chicken.cost)
      expect(page).to have_content(@tortillas.name)
      expect(page).to have_content(@tortillas.cost)
      expect(page).to have_content(@beef.name)
      expect(page).to have_content(@beef.cost)
      expect(page).to have_content(@pasta.name)
      expect(page).to have_content(@pasta.cost)
    end

    it "displays ingredients in alphabetical order" do
      visit "/ingredients"

      expect(@beef.name).to appear_before(@chicken.name)
      expect(@chicken.name).to appear_before(@pasta.name) 
      expect(@pasta.name).to appear_before(@tortillas.name)
    end
  end
end