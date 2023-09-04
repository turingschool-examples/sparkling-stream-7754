require "rails_helper"

RSpec.describe Ingredient, type: :model do

   describe "validations" do
      it { should validate_presence_of :name }
      it { should validate_presence_of :cost }
   end

   describe "relationships" do
      it { should have_many :recipe_ingredients }
      it { should have_many(:recipes).through(:recipe_ingredients) }
   end

   describe "sort alphabetically by name" do
      it "returns ingredients sorted by name" do
         ingredient_1 = Ingredient.create(name: 'Eggs', cost: 2)
         ingredient_2 = Ingredient.create(name: 'Butter', cost: 4)
         ingredient_3 = Ingredient.create(name: 'Chocolate Chips', cost: 5)

         sorted_ingredients = Ingredient.sorted

         expect(sorted_ingredients.first.name).to eq("Butter")
         expect(sorted_ingredients.last.name).to eq("Eggs")
         expect(sorted_ingredients[1].name).to eq("Chocolate Chips")
      end
   end

end