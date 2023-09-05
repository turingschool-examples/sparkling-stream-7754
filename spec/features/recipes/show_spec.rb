require "rails_helper"

RSpec.describe "As a visitor when I visit '/recipes/:id" do
  before :each do
    @bec = Recipe.create!(name: "Bacon, Egg, and Cheese", complexity: 2, genre: "Breakfast")
    @bagel = @bec.ingredient.create!(name: "Everything Bagel", cost: 2)
    @egg = @bec.ingredient.create!(name: "Egg (not microwaved)", cost: 1)
    @bacon = @bec.ingredient.create!(name: "Thick-Cut Bacon", cost: 4)
    @cheese = @bec.ingredient.create!(name: "Estate Gouda", cost: 3)
  end

  it "I see the recipe's name, complexity and genre, and a list of the ingredients" do
    visit "/recipes/#{@bec.id}"

    expect(page).to have_content(@bec.name)
    expect(page).to have_content("Complexity: #{@bec.complexity}")
    expect(page).to have_content("Genre: #{@bec.genre}")
    expect(page).to have_content("Ingredients: #{@bagel.name}, #{@egg.name}, #{@bacon.name}, #{@cheese.name}")
  end
end