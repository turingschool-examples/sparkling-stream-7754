require "rails_helper"

RSpec.describe Recipe, type: :model do
   
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe "relationships" do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

  describe "#total_cost" do 
    it "can return the total cost of the ingredients for a certain recipe" do 
      @recipe_1 = Recipe.create!(name: "Pasta", complexity: 1, genre: "Italian")
      @recipe_2 = Recipe.create!(name: "Beef Bowl", complexity: 2, genre: "Asian")
      @recipe_3 = Recipe.create!(name: "Burrito Bowl", complexity: 2, genre: "Mexican")
      
      @ingredient_1 = @recipe_1.ingredients.create!(name: "Ground Beef", cost: 2)
      @ingredient_2 = @recipe_1.ingredients.create!(name: "Noodles", cost: 1)
      @ingredient_3 = @recipe_1.ingredients.create!(name: "Tomato Sauce", cost: 4)
      
      @ingredient_1 = @recipe_2.ingredients.create!(name: "Ground Beef", cost: 2)
      @ingredient_4 = @recipe_2.ingredients.create!(name: "Rice", cost: 4)
      @ingredient_5 = @recipe_2.ingredients.create!(name: "Broccoli", cost: 3)
      
      @ingredient_4 = @recipe_3.ingredients.create!(name: "Rice", cost: 4)
      @ingredient_1 = @recipe_3.ingredients.create!(name: "Ground Beef", cost: 2)
      @ingredient_6 = @recipe_3.ingredients.create!(name: "Bell Peppers", cost: 4)

      expect(@recipe_1.total_cost).to eq(7)
      expect(@recipe_2.total_cost).to eq(9)
      expect(@recipe_3.total_cost).to eq(10)
    end
  end
end