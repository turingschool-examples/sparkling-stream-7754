class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    
  end

  def create
    recipe = Recipe.new(recipe_params)
    recipe.save
  end

  def recipe_params
    params.permit(:name, :complexity, :genre)
  end
end