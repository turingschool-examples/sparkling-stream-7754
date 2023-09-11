require "rails_helper"

RSpec.describe "the ingredients index" do
  before(:each) do
    @ingredient_1 = Ingredient.create!(name: "Ground Beef", cost: 2)
    @ingredient_2 = Ingredient.create!(name: "Salt", cost: 4)
    @ingredient_3 = Ingredient.create!(name: "Noodles", cost: 1)
    @ingredient_4 = Ingredient.create!(name: "Tomatoes", cost: 2)
    @ingredient_5 = Ingredient.create!(name: "Burg Bun", cost: 1)
  end

  it "lists all ingredients and their attributes" do
    visit "/ingredients"

    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(@ingredient_1.cost)
    # expect(page).to have_content(@ingredient_2.name)
    # expect(page).to have_content(@ingredient_2.cost)
    
    
    expect(page).to have_content("#{@ingredient_2.name}: #{@ingredient_2.cost}")
  end

  it "lists all ingredients in alphabetical order by name" do
    visit "/ingredients"

    expect(@ingredient_5.name).to appear_before(@ingredient_1.name)
    expect(@ingredient_1.name).to appear_before(@ingredient_3.name)
    expect(@ingredient_3.name).to appear_before(@ingredient_2.name)
    expect(@ingredient_2.name).to appear_before(@ingredient_4.name)


  end
end