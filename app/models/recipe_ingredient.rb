class RecipeIngredient < ApplicationRecord
  belongs_to :recipe, required: true
  belongs_to :ingredient, required: true
end