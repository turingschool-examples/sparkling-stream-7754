class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def new

  end

  def create
    ingredient = Ingredient.new(ingredient_params)
    ingredient.save
    redirect_to "/ingredients"
  end

  def ingredient_params
    params.permit(:name, :cost)
  end
end