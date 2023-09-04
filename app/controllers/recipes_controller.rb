class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.find(params[:ingredient_id])
    @recipe.ingredients << @ingredient
    redirect_to "/recipes/#{@recipe.id}"
  end
end
