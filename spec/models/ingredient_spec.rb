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

  describe "instance methods" do
    describe "#order_names" do

      it "order ingredients" do
         bread = Ingredient.create!(name: "Bread", cost:2)
         cheese = Ingredient.create!(name: "Cheese", cost:3)
         pasta = Ingredient.create!(name: "Pasta", cost:3)

         expect(Ingredient.all.first).to eq(bread)
      end
    end
  end
end