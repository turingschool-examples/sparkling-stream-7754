class Recipe < ApplicationRecord
   validates_presence_of :name, :complexity, :genre
   has_many :recipe_ingredients
   has_many :ingredients, through: :recipe_ingredients

   def ingredient_names
      Recipe.joins(:ingredients).where(id: self.id).pluck("ingredients.name")
   end
end