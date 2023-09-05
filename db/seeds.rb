# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ingredient1 = Ingredient.create(name: "Apple", cost: 1)
ingredient2 = Ingredient.create(name: "Pie Crust", cost: 2)
ingredient3 = Ingredient.create(name: "Pie Filling", cost: 2)
recipe1 = Recipe.create(name: "Apple Pie", complexity: 3, genre: "Baking")
