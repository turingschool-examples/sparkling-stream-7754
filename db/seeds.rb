# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Ingredient.create(name: 'Eggs', cost: 2)
# Ingredient.create(name: 'Butter', cost: 4)
# Ingredient.create(name: 'Chocolate Chips', cost: 5)

cookies = Recipe.create!(name: "Cookies", complexity: 2, genre: "Dessert")
ingredient_1 = cookies.ingredients.create(name: 'Eggs', cost: 2)
ingredient_2 = cookies.ingredients.create(name: 'Butter', cost: 4)
ingredient_3 = cookies.ingredients.create(name: 'Chocolate Chips', cost: 5)