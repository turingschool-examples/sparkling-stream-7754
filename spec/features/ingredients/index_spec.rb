require "rails_helper"

RSpec.describe "As a visitor when I visit '/ingredients'" do
  before :each do
    @gb = Ingredient.create!(name: "Ground Beef", cost: 2)
    @nacl = Ingredient.create!(name: "Salt", cost: 4)
    @avo = Ingredient.create!(name: "Avocado", cost: 3)
  end

  it "I see a list of all the ingredients including their name and cost" do
    visit "/ingredients"

    expect(page).to have_content("#{@gb.name}: #{@gb.cost}")
    expect(page).to have_content("#{@nacl.name}: #{@nacl.cost}")
  end

  it "I see that the list of ingredients is sorted alphabetically by name" do
    visit "/ingredients"

    expect(@avo.name).to appear_before(@gb.name)
    expect(@gb.name).to appear_before(@nacl.name)
  end
end