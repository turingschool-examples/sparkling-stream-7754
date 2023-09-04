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

   describe "#sort_alphabetical" do
      it "sorts the ingredients alphabetically" do
         ingredient_2 = Ingredient.create(name: "Pasta Sauce", cost: 4)
         ingredient_1 = Ingredient.create(name: "Pasta", cost: 2)

         expect(Ingredient.sort_alphabetical).to eq([ingredient_1, ingredient_2])
      end
   end
end