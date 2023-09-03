require "rails_helper"

RSpec.describe "ingredient index" do
  it "list ingredients with there attributes" do
    apple = Ingredient.create!(name: "apple", cost: 2)
    bread = Ingredient.create!(name: "bread", cost: 4)
    clove = Ingredient.create!(name: "clove", cost: 8)

    visit "/ingredients"
    
    expect(page).to have_content("apple")
    expect(page).to have_content("2")
    expect(page).to have_content("bread")
    expect(page).to have_content("clove")
  end

  it "list ingredients with there attributes" do
    bread = Ingredient.create!(name: "bread", cost: 4)
    apple = Ingredient.create!(name: "apple", cost: 2)
    clove = Ingredient.create!(name: "clove", cost: 8)

    visit "/ingredients"

    expect("apple").to appear_before("bread")
    expect("bread").to appear_before("clove")
  end
end