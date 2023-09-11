# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# recipe 1 should use 1,2,3,4 and recipe 2 should use 1,2,5
@recipe_1 = Recipe.create!(name: "Spaghetti", complexity: 3, genre: "Italian")
@recipe_2 = Recipe.create!(name: "Burger", complexity: 1, genre: "American")

@ingredient_1 = Ingredient.create!(name: "Ground Beef", cost: 2)
@ingredient_2 = Ingredient.create!(name: "Salt", cost: 4)
@ingredient_3 = Ingredient.create!(name: "Noodles", cost: 1)
@ingredient_4 = Ingredient.create!(name: "Tomatoes", cost: 2)
@ingredient_5 = Ingredient.create!(name: "Burg Bun", cost: 1)

@spaghetti_1 = RecipeIngredient.create!(recipe: @recipe_1, ingredient: @ingredient_1)
@spaghetti_2 = RecipeIngredient.create!(recipe: @recipe_1, ingredient: @ingredient_2)
@spaghetti_3 = RecipeIngredient.create!(recipe: @recipe_1, ingredient: @ingredient_3)
    




