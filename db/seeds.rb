# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
recipe = Recipe.create!(name: 'Omlette', complexity: 1, genre: 'Breakfast')
cheese = Ingredient.create!(name: 'Cheese', cost: 1)
eggs = Ingredient.create!(name: 'Eggs', cost: 2)
bacon = Ingredient.create!(name: 'Bacon', cost: 3)
RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: cheese.id)
RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: eggs.id)
RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: bacon.id)