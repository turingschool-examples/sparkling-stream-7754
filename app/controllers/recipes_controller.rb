class RecipesController < ApplicationController

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredient_names
    @cost = @recipe.ingredients_cost
  end

#   def create
#     @recipe = Recipe.find([params[:id]])
#     if params[:ingredient_id] != nil
#       RecipeIngredient.create(recipe_id: @recipe.id, ingredient_id: params[:ingredient_id])
#     end

#     redirect_to "/recipes/#{params[:id]}"
#   end
end