# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
@cheese = Ingredient.create!( name: "Cheese",cost: 4 )
@milk = Ingredient.create!( name: "Milk",cost: 3 )
@eggs = Ingredient.create!( name: "Eggs",cost: 7 )
@mushrooms = Ingredient.create!( name: "Mushrooms",cost: 5 )
@onion = Ingredient.create!( name: "Onions",cost: 2 )
@truff = Ingredient.create!( name: "Truffles",cost: 34 )
@crab = Ingredient.create!( name: "Lump Crab Meat",cost: 17 )

@omelette = Recipe.create!( name: "Omelette", complexity: 3, genre: "Breakfast")
@pizza = Recipe.create!( name: "Pizza", complexity: 5, genre: "Party")
@Chilli = Recipe.create!( name: "Beef Chilli", complexity: 4, genre: "Tex-Mex")
@crab = Recipe.create!( name: "Crab Cakes", complexity: 5, genre: "Seafood")
@chowda = Recipe.create!( name: "Corn Chowder", complexity: 4, genre: "Soup")
@welli = Recipe.create!( name: "Beef Wellingtion", complexity: 7, genre: "Main Dish")