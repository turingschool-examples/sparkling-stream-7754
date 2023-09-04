# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
recipe = Recipe.create!(name: 'Pancakes', complexity: 1, genre: 'Breakfast')
flour = Ingredient.create!(name: 'Flour', cost: 50)
eggs = Ingredient.create!(name: 'Eggs', cost: 200)
milk = Ingredient.create!(name: 'Milk', cost: 200)
RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: flour.id)
RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: eggs.id)
RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: milk.id)