class RecipeIngredientsController < ApplicationController
  def create
    recipe = Recipe.find(params[:id])
    ingredient = recipe.ingredients.create!(name: params[:name], cost: params[:cost])
    redirect_to "/recipes/#{recipe.id}"
  end
end