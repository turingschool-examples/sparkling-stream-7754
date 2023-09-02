class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.sort_alpha
  end
end