# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

recipe_1 = Recipe.create!(name: "Oops, all Beef!", complexity: 1, genre: "Horrible")
recipe_2 = Recipe.create!(name: "Literally Potatoes", complexity: 2, genre: "Rustic")
ingredient_1 = recipe_1.ingredients.create!(name: "Ground Beef", cost: 2)
ingredient_2 = recipe_1.ingredients.create!(name: "Salt", cost: 4)
ingredient_3 = recipe_1.ingredients.create!(name: "An Ingredient Starting with A", cost: 3)
ingredient_4 = recipe_2.ingredients.create!(name: "Potato", cost: 1)