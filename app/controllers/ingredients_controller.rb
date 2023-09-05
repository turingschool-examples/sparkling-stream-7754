class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.order(:name)
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