# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@recipe_1 = Recipe.create!(name: "Pasta", complexity: 1, genre: "Italian")
@recipe_2 = Recipe.create!(name: "Beef Bowl", complexity: 2, genre: "Asian")
@recipe_3 = Recipe.create!(name: "Burrito Bowl", complexity: 2, genre: "Mexican")

@ingredient_1 = @recipe_1.ingredients.create!(name: "Ground Beef", cost: 2)
@ingredient_2 = @recipe_1.ingredients.create!(name: "Noodles", cost: 1)
@ingredient_3 = @recipe_1.ingredients.create!(name: "Tomato Sauce", cost: 4)

@ingredient_1 = @recipe_2.ingredients.create!(name: "Ground Beef", cost: 2)
@ingredient_4 = @recipe_2.ingredients.create!(name: "Rice", cost: 4)
@ingredient_5 = @recipe_2.ingredients.create!(name: "Broccoli", cost: 3)

@ingredient_4 = @recipe_3.ingredients.create!(name: "Rice", cost: 4)
@ingredient_1 = @recipe_3.ingredients.create!(name: "Ground Beef", cost: 2)
@ingredient_6 = @recipe_3.ingredients.create!(name: "Bell Peppers", cost: 4)