require "rails_helper"


RSpec.describe "recipes show page", type: :feature do
  before :each do
    @cheese = Ingredient.create!( name: "Cheese",cost: 4 )
    @milk = Ingredient.create!( name: "Milk",cost: 3 )
    @eggs = Ingredient.create!( name: "Eggs",cost: 7 )
    @mushrooms = Ingredient.create!( name: "Mushrooms",cost: 5 )
    @onion = Ingredient.create!( name: "Onions",cost: 2 )
    @truff = Ingredient.create!( name: "Truffles",cost: 34 )
    @crab = Ingredient.create!( name: "Lump Crab Meat",cost: 17 )

    @omelette = Recipe.create!( name: "Omelette", complexity: 3, genre: "Breakfast")
    @crab_cake = Recipe.create!( name: "Crab Cakes", complexity: 5, genre: "Seafood")

    @dish_1 = RecipeIngredient.create!(ingredient_id: @cheese.id, recipe_id: @omelette.id)
    @dish_1 = RecipeIngredient.create!(ingredient_id: @eggs.id, recipe_id: @omelette.id)
    @dish_1 = RecipeIngredient.create!(ingredient_id: @mushrooms.id, recipe_id: @omelette.id)
    @dish_1 = RecipeIngredient.create!(ingredient_id: @onion.id, recipe_id: @omelette.id)

    @dish_2 = RecipeIngredient.create!(ingredient_id: @crab.id, recipe_id: @crab_cake.id)
    @dish_2 = RecipeIngredient.create!(ingredient_id: @milk.id, recipe_id: @crab_cake.id)
    @dish_2 = RecipeIngredient.create!(ingredient_id: @onion.id, recipe_id: @crab_cake.id)
    @dish_2 = RecipeIngredient.create!(ingredient_id: @truff.id, recipe_id: @crab_cake.id)

  end


  # ------   User Story 2 - Recipes Show
  # As a visitor,
  # When I visit '/recipes/:id',
  # Then I see the recipe's name, complexity and genre,
  # and I see a list of the names of the ingredients for the recipe.

  describe "When I visit '/ingredients'" do
    it "displays list of all the ingredients including their name and cost" do
      visit "/recipes/#{@omelette.id}"

      expect(page).to have_content(@omelette.name)
      expect(page).to have_content(@omelette.complexity)
      expect(page).to have_content(@omelette.genre)
      expect(page).to have_content(@cheese.name)
      expect(page).to have_content(@eggs.name)
      expect(page).to have_content(@onion.name)
    end

    # ------   User Story 3 - Shows total cost of recipe
    it "shows the total cost of the recipe" do
      visit "/recipes/#{@omelette.id}"

      expect(page).to have_content("Total Cost: 18")
    end
  end
end



