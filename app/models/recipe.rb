class Recipe < ApplicationRecord
   has_many :recipe_ingredients
   has_many :ingredients, through: :recipe_ingredients
   validates_presence_of :name, :complexity, :genre

   def total_cost
      ingredients.sum(:cost)
   end
end