#User Story 1 - Ingredients Index

RSpec.describe "Ingredients index" do
  before :each do
    @ingredient_1 = Ingredient.create!(name: "Ground Beef", cost: 2)
    @ingredient_2 = Ingredient.create!(name: "Salt", cost: 4)
  end

  it "Displays all ingredients, including their name and cost" do
    visit "/ingredients"

    expect(page).to have_content(@ingredient_1.name)
    expect(page).to have_content(@ingredient_1.cost)
    expect(page).to have_content(@ingredient_2.name)
    expect(page).to have_content(@ingredient_2.cost)
  end
end