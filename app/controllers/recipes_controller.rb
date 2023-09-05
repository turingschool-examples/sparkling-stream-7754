class RecipesController < ApplicationController

  def show 
    @recipe = Recipe.find(params[:id])
    # @ingredient = Ingredient.find(params{:id})
  end
end