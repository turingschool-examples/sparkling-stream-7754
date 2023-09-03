class RecipeIngredientsController < ApplicationController
  def create
    RecipeIngredient.create!(recipe: Recipe.find(params[:ingrediant_id]), ingredient: Ingredient.find_by(name: params[:name]))

    redirect_to "/recipes/#{params[:ingrediant_id]}"
  end
end
