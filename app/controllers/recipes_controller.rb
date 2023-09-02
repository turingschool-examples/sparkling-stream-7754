class RecipesController < ApplicationController
  def show 
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients.build
  end
end