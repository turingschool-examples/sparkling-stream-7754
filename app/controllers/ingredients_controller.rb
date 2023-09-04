class IngredientsController < ApplicationController
    def index
        @ingredients = Ingredient.sorted
    end
end