require "rails_helper"

RSpec.describe "As a visitor when I visit '/recipes/:id" do
  before :each do
    @bec = Recipe.create!(name: "Bacon, Egg, and Cheese", complexity: 2, genre: "Breakfast")
    @bagel = @bec.ingredients.create!(name: "Everything Bagel", cost: 2)
    @egg = @bec.ingredients.create!(name: "Egg (not microwaved)", cost: 1)
    @bacon = @bec.ingredients.create!(name: "Thick-Cut Bacon", cost: 4)
    @cheese = @bec.ingredients.create!(name: "Estate Gouda", cost: 3)
  end

  it "I see the recipe's name, complexity and genre, and a list of the ingredients" do
    visit "/recipes/#{@bec.id}"

    expect(page).to have_content(@bec.name)
    expect(page).to have_content("Complexity: #{@bec.complexity}")
    expect(page).to have_content("Genre: #{@bec.genre}")
    expect(page).to have_content("Ingredients: #{@bagel.name}, #{@egg.name}, #{@bacon.name}, #{@cheese.name}")
  end

  it "I see the total cost of all ingredients in the recipe" do
    visit "/recipes/#{@bec.id}"

    expect(page).to have_content("Total Cost: #{@bec.total_cost}")
  end

  it "I see a form to add a new ingredient" do
    visit "/recipes/#{@bec.id}"

    expect(page).to have_button("Add Ingredient")

    fill_in "Name", with: "Hot Sauce"
    fill_in "Cost", with: 1

    click_button("Add Ingredient")

    expect(current_path).to eq("/recipes/#{@bec.id}")

    expect(page).to have_content(("Ingredients: #{@bagel.name}, #{@egg.name}, #{@bacon.name}, #{@cheese.name}, Hot Sauce"))
  end
end