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

  describe "total cost" do
    it "can calculate the total cost of all ingredients" do
      recipe_1 = Recipe.create!(name: "Burrito Bowl", complexity: 2, genre: "Latin")
      ingredient_1 = Ingredient.create!(name: "Rice", cost: 4)
      ingredient_2 = Ingredient.create!(name: "Avocado", cost: 1)
      ingredient_3 = Ingredient.create!(name: "Chicken", cost: 7)
      recipe_1.ingredients << ingredient_1
      recipe_1.ingredients << ingredient_2
      recipe_1.ingredients << ingredient_3

      expect(recipe_1.total_cost).to eq(12)
    end
  end
end