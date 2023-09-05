require 'rails_helper'

RSpec.describe 'ingredients index' do
  it "lists all ingredients and their cost" do
    ingredient_1 = Ingredient.create(name: "Ground Beef", cost: 2)
    ingredient_2 = Ingredient.create(name: "Salt", cost: 4)

    visit "/ingredients"
    save_and_open_page

    expect(page).to have_content(ingredient_1.name)
    expect(page).to have_content(ingredient_1.cost)
    expect(page).to have_content(ingredient_2.name)
    expect(page).to have_content(ingredient_1.cost)

  end
end