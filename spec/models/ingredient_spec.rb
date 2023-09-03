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

   it "can alphabetize ingredients by name" do
      bread = Ingredient.create!(name: "bread", cost: 4)
      apple = Ingredient.create!(name: "apple", cost: 2)
      clove = Ingredient.create!(name: "clove", cost: 8)

      expect(Ingredient.all.alphabetical_name).to eq([apple, bread, clove])
   end

end