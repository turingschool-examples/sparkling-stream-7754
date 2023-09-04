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
    it "returns total cost of recipe's ingredients" do
      recipe_1 = Recipe.create!(
        name: "Mac and Cheese",
        complexity: "Easy",
        genre: "Comfort"
      )

      cheese = recipe_1.ingredients.create!(
        name: "Cheese",
        cost: "2"
      )

      noodles = recipe_1.ingredients.create!(
        name: "Noodles",
        cost: "6"
      )

      expect(recipe_1.total_cost).to eq(8)
    end
  end
end