class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  validates_presence_of :name, :cost
end