class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
    @ingredient_ids = Ingredient.ids
  end
end