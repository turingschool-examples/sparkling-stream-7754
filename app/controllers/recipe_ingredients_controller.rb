class RecipeIngredientsController < ApplicationController
  def create
    RecipeIngredient.create!(recipe_id: params[:id], ingredient_id: params[:ingredient_id])
    redirect_to "/recipes/#{params[:id]}"
  end
end