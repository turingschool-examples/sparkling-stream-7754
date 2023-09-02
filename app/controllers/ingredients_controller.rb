class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all.order_names
  end
end