require "rails_helper"


RSpec.describe "constellations index page", type: :feature do
  before :each do
    @cheese = Ingredient.create!( name: "Cheese",cost: 4 )
    @milk = Ingredient.create!( name: "Milk",cost: 3 )
    @eggs = Ingredient.create!( name: "Eggs",cost: 7 )
    @mushrooms = Ingredient.create!( name: "Mushrooms",cost: 5 )
    @onion = Ingredient.create!( name: "Onions",cost: 2 )
    @truff = Ingredient.create!( name: "Truffles",cost: 34 )
    @crab = Ingredient.create!( name: "Lump Crab Meat",cost: 17 )
    
    @omelette = Recipe.create!( name: "Omelette", complexity: 3, genre: "Breakfast")
    @pizza = Recipe.create!( name: "Pizza", complexity: 5, genre: "Party")
    @Chilli = Recipe.create!( name: "Beef Chilli", complexity: 4, genre: "Tex-Mex")
    @crab_cakes = Recipe.create!( name: "Crab Cakes", complexity: 5, genre: "Seafood")
    @chowda = Recipe.create!( name: "Corn Chowder", complexity: 4, genre: "Soup")
    @welli = Recipe.create!( name: "Beef Wellingtion", complexity: 7, genre: "Main Dish")
    
    RecipeIngredient.create!(ingredient_id: @cheese.id, recipe_id: @omelette.id)
    RecipeIngredient.create!(ingredient_id: @eggs.id, recipe_id: @omelette.id)
    RecipeIngredient.create!(ingredient_id: @mushrooms.id, recipe_id: @omelette.id)
    RecipeIngredient.create!(ingredient_id: @onion.id, recipe_id: @omelette.id)
  end


# ------- User Story 1 - Ingredients Index
# As a visitor,
# When I visit '/ingredients'
# I see a list of all the ingredients including their name and cost
# (e.g. "Ground Beef: 2" "Salt: 4")

  describe "When I visit '/ingredients'" do
    it "displays list of all the ingredients including their name and cost" do
      visit "/ingredients"

      expect(page).to have_content(@cheese.name)
      expect(page).to have_content(@cheese.cost)
      expect(page).to have_content(@milk.name)
      expect(page).to have_content(@milk.cost)
      expect(page).to have_content(@eggs.name)
      expect(page).to have_content(@eggs.cost)
      expect(page).to have_content(@mushrooms.name)
      expect(page).to have_content(@mushrooms.cost)
    end

    it "displays the ingredients in alphabetical order" do
      visit '/ingredients'

      #expect(@cheese.name).to appear_before(@eggs.name)
      #xpect(@milk.name).to appear_before(@mushrooms.name)
    end
  end
end