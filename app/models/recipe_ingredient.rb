class RecipeIngredient < ApplicationRecord
  belongs_to :integredient
  belongs_to :recipe
end