class RecipesController < ApplicationController

  def show
    @recipe = Recipe.find(params[:recipe_id])
  end

  def update
    ingredient = Ingredient.find(params[:id])
    recipe = Recipe.find(params[:recipe_id])
    recipe.ingredients << ingredient

    redirect_to "/recipes/#{params[:recipe_id]}"
  end
end