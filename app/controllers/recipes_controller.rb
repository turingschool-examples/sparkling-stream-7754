class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.find_ingredients
    @cost = @recipe.find_cost
  end
end