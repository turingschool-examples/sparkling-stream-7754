class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.ingredients_sorted
  end
end