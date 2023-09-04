# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
    ingredient_1 = Ingredient.create!(name: "Pasta", cost: 2)
    ingredient_2 = Ingredient.create!(name: "Pasta Sauce", cost: 4)

    recipe_1 = Recipe.create(name: "Spaghetti", complexity: 2, genre: "Italian")
    RecipeIngredient.create(recipe: recipe_1, ingredient: ingredient_1)
    RecipeIngredient.create(recipe: recipe_1, ingredient: ingredient_2)