class RecipeIngredientsController < ApplicationController
  
    def create
      @recipe = Recipe.find([params[:id]])
      if params[:ingredient_id] != nil
        RecipeIngredient.create(recipe_id: params[:id], ingredient_id: params[:ingredient_id])
      end
  
      redirect_to "/recipes/#{params[:id]}"
    end

end