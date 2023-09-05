# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

@pasta = Recipe.create!(name: 'Pasta', complexity: 2, genre: 'Italian')
@burger = Recipe.create!(name: 'Burger', complexity: 3, genre: 'American')
@sushi = Recipe.create!(name: 'Sushi', complexity: 4, genre: 'Japanese')

@ground_beef = Ingredient.create!(name: 'Ground Beef', cost: 5)
@penne = Ingredient.create!(name: 'Penne', cost: 2)
@tomato = Ingredient.create!(name: 'Tomato', cost: 3)
@cheese = Ingredient.create!(name: 'Cheese', cost: 4)
@bun = Ingredient.create!(name: 'Bun', cost: 2)
@rice = Ingredient.create!(name: 'Rice', cost: 3)
@fish = Ingredient.create!(name: 'Fish', cost: 6)

RecipeIngredient.create!(recipe: @pasta, ingredient: @ground_beef)
RecipeIngredient.create!(recipe: @pasta, ingredient: @penne)
RecipeIngredient.create!(recipe: @pasta, ingredient: @tomato)
  
RecipeIngredient.create!(recipe: @burger, ingredient: @ground_beef)
RecipeIngredient.create!(recipe: @burger, ingredient:  @cheese)
RecipeIngredient.create!(recipe: @burger, ingredient: @tomato)

RecipeIngredient.create!(recipe: @sushi, ingredient: @rice)
RecipeIngredient.create!(recipe: @sushi, ingredient: @fish)

