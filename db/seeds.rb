# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@bolognese_recipe = Recipe.create!(name: "Bolognese", complexity: 3, genre: "Italian")
@chicken_tacos_recipe = Recipe.create!(name: "Chicken Tacos", complexity: 2, genre: "Mexican")

@chicken = Ingredient.create!(name: "Chicken", cost: 5)
@tortillas = Ingredient.create!(name: "Tortillas", cost: 2)

@beef = Ingredient.create!(name: "Beef", cost: 4)
@pasta = Ingredient.create!(name: "Pasta", cost: 1)

@recipe_ingredients_1 = RecipeIngredient.create!(recipe_id: "#{@bolognese_recipe.id}", ingredient_id:"#{@beef.id}")
@recipe_ingredients_1 = RecipeIngredient.create!(recipe_id: "#{@bolognese_recipe.id}", ingredient_id:"#{@pasta.id}")
@recipe_ingredients_1 = RecipeIngredient.create!(recipe_id: "#{@chicken_tacos_recipe.id}", ingredient_id:"#{@chicken.id}")
@recipe_ingredients_2 = RecipeIngredient.create!(recipe_id: "#{@chicken_tacos_recipe.id}", ingredient_id:"#{@tortillas.id}")