require 'rails_helper'

RSpec.describe "Ingredients Index Page" do 
  before(:each) do 
    ingredient1 = Ingredient.create!(name: "Ground Beef", cost: "2")
    ingredient2 = Ingredient.create!(name: "Salt", cost: "1")
    ingredient3 = Ingredient.create!(name: "Rice", cost: "4")
  end
  it "can display a list of all available ingredients and their cost" do 
    visit "/ingredients"

    expect(page).to have_content(ingredient1.name)
    expect(page).to have_content(ingredient1.cost)

    expect(page).to have_content(ingredient2.name)
    expect(page).to have_content(ingredient2.cost)

    expect(page).to have_content(ingredient3.name)
    expect(page).to have_content(ingredient3.cost)

  end

end