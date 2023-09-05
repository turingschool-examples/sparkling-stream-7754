class Recipe < ApplicationRecord
   validates_presence_of :name, :complexity, :genre

   has_many :recipe_ingredients
   has_many :ingredients, through: :recipe_ingredients

   def all_ingredients
      #there may be a better way to do this with AR but considering the circumstances this will do for now
      list = []
      self.ingredients.each do |ingredient|
         list << ingredient.name
      end

      list.join(", ")
   end
   
   def total_cost
      cost = 0
      self.ingredients.each do |ingredient|
         cost += ingredient.cost
      end
      cost
   end
end