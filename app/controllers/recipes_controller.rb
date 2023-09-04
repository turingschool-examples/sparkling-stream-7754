class RecipesController < ApplicationController

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
    @cost = @recipe.ingredient_sum
  end

  def create
    @recipe = Recipe.find(params[:id])
    RecipeIngredient.create!(recipe_id: @recipe.id, ingredient_id: (params[:ingredient]))
    redirect_to "/recipes/#{@recipe.id}"
  end

end