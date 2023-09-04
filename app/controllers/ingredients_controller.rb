class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all.sort_alphabetical
  end

end