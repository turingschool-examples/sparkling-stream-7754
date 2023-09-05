class RecipeIngredientsController < ApplicationController
  def create
    RecipeIngredient.create!(recipe: Recipe.find(params[:id]), ingredient: Ingredient.find(params[:add_ingredient]))
    redirect_to "/recipes/#{params[:id]}"
  end
end