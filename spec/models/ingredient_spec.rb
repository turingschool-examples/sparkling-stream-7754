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

   describe "class methods" do
      it "can display ingredients in alphabetical order by name" do
         ground_beef = Ingredient.create!(name: "Ground Beef", cost: 2)
         salt = Ingredient.create!(name: "Salt", cost: 4)
         eggs = Ingredient.create!(name: "Eggs", cost: 3)
         milk = Ingredient.create!(name: "Milk", cost: 2)
         flour = Ingredient.create!(name: "Flour", cost: 5)

         query = Ingredient.sort_alpha

         expect(query).to eq([eggs, flour, ground_beef, milk, salt])
      end
   end
end