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

   describe "#ingredients_sorted" do
    it "returns list of ingredients sorted by name" do
      onion = Ingredient.create!(name: "Onion", cost: 1)
      tomato = Ingredient.create!(name: "Tomato", cost: 1)
      pepper = Ingredient.create!(name: "Bell Pepper", cost:1)

      expect(Ingredient.ingredients_sorted).to eq([pepper, onion, tomato])
    end
   end
end