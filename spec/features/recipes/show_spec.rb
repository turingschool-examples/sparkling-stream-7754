require "rails_helper"

RSpec.describe "Recipe Show Page" do 
  before(:each) do 
    @recipe_1 = Recipe.create!(name: "Pasta", complexity: 1, genre: "Italian")
    @recipe_2 = Recipe.create!(name: "Beef Bowl", complexity: 2, genre: "Asian")
    @recipe_3 = Recipe.create!(name: "Burrito Bowl", complexity: 2, genre: "Mexican")

    @ingredient_1 = @recipe_1.ingredients.create!(name: "Ground Beef", cost: 2)
    @ingredient_2 = @recipe_1.ingredients.create!(name: "Noodles", cost: 1)
    @ingredient_3 = @recipe_1.ingredients.create!(name: "Tomato Sauce", cost: 4)
    
    @ingredient_1 = @recipe_2.ingredients.create!(name: "Ground Beef", cost: 2)
    @ingredient_4 = @recipe_2.ingredients.create!(name: "Rice", cost: 4)
    @ingredient_5 = @recipe_2.ingredients.create!(name: "Broccoli", cost: 3)
    
    @ingredient_4 = @recipe_3.ingredients.create!(name: "Rice", cost: 4)
    @ingredient_1 = @recipe_3.ingredients.create!(name: "Ground Beef", cost: 2)
    @ingredient_6 = @recipe_3.ingredients.create!(name: "Bell Peppers", cost: 4)
  end

  it "can show the recipe name, complexity, and genre" do 
    visit "/recipes/#{@recipe_1.id}"

    expect(page).to have_content("Recipe Name: Pasta")
    expect(page).to have_content("Complexity: 1")
    expect(page).to have_content("Genre: Italian")
    
    visit "/recipes/#{@recipe_2.id}"
    expect(page).to have_content("Recipe Name: Beef Bowl")
    expect(page).to have_content("Complexity: 2")
    expect(page).to have_content("Genre: Asian")
    
    visit "/recipes/#{@recipe_3.id}"
    expect(page).to have_content("Recipe Name: Burrito Bowl")
    expect(page).to have_content("Complexity: 2")
    expect(page).to have_content("Genre: Mexican")
  end
  
  it "can show a list of ingredients associated with that recipe" do 
    visit "/recipes/#{@recipe_1.id}"

    expect(page).to have_content("Ground Beef")
    expect(page).to have_content("Noodles")
    expect(page).to have_content("Tomato Sauce")
    
    visit "/recipes/#{@recipe_2.id}"
    expect(page).to have_content("Ground Beef")
    expect(page).to have_content("Rice")
    expect(page).to have_content("Broccoli")

    
    visit "/recipes/#{@recipe_3.id}"
    expect(page).to have_content("Ground Beef")
    expect(page).to have_content("Rice")
    expect(page).to have_content("Bell Peppers")
  end

  it "can show the total cost of all ingredients necessary for the recipe" do 
    visit "/recipes/#{@recipe_1.id}"
    expect(page).to have_content("Total Cost: 7")
    
    visit "/recipes/#{@recipe_2.id}"
    expect(page).to have_content("Total Cost: 9")
    
    visit "/recipes/#{@recipe_3.id}"
    expect(page).to have_content("Total Cost: 10")
  end
        
end