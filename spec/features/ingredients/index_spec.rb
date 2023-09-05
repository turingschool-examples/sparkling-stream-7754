require "rails_helper"

RSpec.describe "the ingredients index" do
  it "see a list of all the ingredients including their name and cost" do
    beef = Ingredient.create(name: "Ground Beef", cost: 2)
    cheese = Ingredient.create(name: "American Cheese", cost: 1)
    bun = Ingredient.create(name: "Brioche Bun", cost: 3)

    visit "/ingredients"

    expect(page).to have_content(beef.name)
    expect(page).to have_content(beef.cost)

    expect(page).to have_content(cheese.name)
    expect(page).to have_content(cheese.cost)

    expect(page).to have_content(bun.cost)
    expect(page).to have_content(bun.cost)
    # save_and_open_page
  end
end