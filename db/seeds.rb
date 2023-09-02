# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ground_beef = Ingredient.create!(name: "Ground Beef", cost: 2)
salt = Ingredient.create!(name: "Salt", cost: 4)
pancakes = Recipe.create!(name: "Pancakes", complexity: 1, genre: "Breakfast")
eggs = pancakes.ingredients.create!(name: "Eggs", cost: 3)
milk = pancakes.ingredients.create!(name: "Milk", cost: 2)
flour = pancakes.ingredients.create!(name: "Flour", cost: 5)