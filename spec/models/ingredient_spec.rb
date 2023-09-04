require "rails_helper"

RSpec.describe Ingredient, type: :model do
   before :each do
      @chicken = Ingredient.create!(name: "Chicken", cost: 5)
      @tortillas = Ingredient.create!(name: "Tortillas", cost: 2)
      @beef = Ingredient.create!(name: "Beef", cost: 4)
      @pasta = Ingredient.create!(name: "Pasta", cost: 1)
   end

   describe "validations" do
      it { should validate_presence_of :name }
      it { should validate_presence_of :cost }
   end

   describe "relationships" do
      it { should have_many :recipe_ingredients }
      it { should have_many(:recipes).through(:recipe_ingredients) }
   end

   describe "class methods" do
      it "#sort_alphabetically" do
         expect(Ingredient.sort_alphabetically).to eq([@beef, @chicken, @pasta, @tortillas])
      end 
   end

end