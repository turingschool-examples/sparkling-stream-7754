class RecipesController < ApplicationController

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredient_names
    @cost = @recipe.ingredients_cost
  end

end