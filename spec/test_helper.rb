def load_test_data 
  @pasta = Recipe.create!(name: 'Pasta', complexity: 2, genre: 'Italian')
  @burger = Recipe.create!(name: 'Burger', complexity: 3, genre: 'American')
  @sushi = Recipe.create!(name: 'Sushi', complexity: 4, genre: 'Japanese')

  @ground_beef = Ingredient.create!(name: 'Ground Beef', cost: 5)
  @penne = Ingredient.create!(name: 'Penne', cost: 2)
  @tomato = Ingredient.create!(name: 'Tomato', cost: 3)
  @cheese = Ingredient.create!(name: 'Cheese', cost: 4)
  @buns = Ingredient.create!(name: 'Buns', cost: 2)
  @rice = Ingredient.create!(name: 'Rice', cost: 3)
  @fish = Ingredient.create!(name: 'Fish', cost: 6)
end