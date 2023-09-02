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

  describe "class methods" do
    it "can calculate the total cost of a recipes ingredients" do
      pancakes = Recipe.create!(name: "Pancakes", complexity: 1, genre: "Breakfast")
      eggs = pancakes.ingredients.create!(name: "Eggs", cost: 3)
      milk = pancakes.ingredients.create!(name: "Milk", cost: 2)
      flour = pancakes.ingredients.create!(name: "Flour", cost: 5)
      
      query = pancakes.total_cost

      expect(query).to eq(10)
    end
  end
end