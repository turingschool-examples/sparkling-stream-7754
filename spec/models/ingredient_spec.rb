require "rails_helper"

RSpec.describe Ingredient, type: :model do
   before(:each) do
      @ingredient_1 = Ingredient.create!(name: "Ground Beef", cost: 2)
      @ingredient_2 = Ingredient.create!(name: "Salt", cost: 4)
      @ingredient_3 = Ingredient.create!(name: "Noodles", cost: 1)
      @ingredient_4 = Ingredient.create!(name: "Tomatoes", cost: 2)
      @ingredient_5 = Ingredient.create!(name: "Burg Bun", cost: 1)
   end

   describe "validations" do
      it { should validate_presence_of :name }
      it { should validate_presence_of :cost }
   end

   describe "relationships" do
      it { should have_many :recipe_ingredients }
      it { should have_many(:recipes).through(:recipe_ingredients) }
   end

   describe "class method" do
      # a period rather than a hashtag to denote a class method
      it ".order_by_name" do
         expect(Ingredient.order_by_name).to eq([
            @ingredient_5, @ingredient_1, @ingredient_3, @ingredient_2, @ingredient_4
            ])
      end
   end
end