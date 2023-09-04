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

  describe "#sum" do
    it "sums the cost column for a given amount" do
      ingredient_1 = Ingredient.create(name: "Pasta", cost: 2)
      ingredient_2 = Ingredient.create(name: "Pasta Sauce", cost: 4)
      recipe_1 = Recipe.create(name: "Spaghetti", complexity: 2, genre: "Italian")
      RecipeIngredient.create(recipe: recipe_1, ingredient: ingredient_1)
      RecipeIngredient.create(recipe: recipe_1, ingredient: ingredient_2)
      expect(recipe_1.ingredient_sum).to eq(6)
    end
  end
end