class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
                             .alphabetical_name
  end
end