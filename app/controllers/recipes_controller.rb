class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @total_cost = @recipe.total_cost
  end

  def update
    ingredient = Ingredient.find(params[:ingredient_id])
    Recipe.first.ingredients.create!(name: ingredient.name, cost: ingredient.cost)

    redirect_to "/recipes/#{Recipe.first.id}"
  end
end