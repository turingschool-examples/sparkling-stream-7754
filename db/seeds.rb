# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ingredient1 = Ingredient.create!(name: "Ground Beef", cost: "2")
ingredient2 = Ingredient.create!(name: "Salt", cost: "1")
ingredient3 = Ingredient.create!(name: "Rice", cost: "4")