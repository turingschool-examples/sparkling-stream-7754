class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.get_ingredient_names
    @cost = @recipe.recipe_cost
  end
end