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

  describe "#instance methods" do
    it "#total_cost" do
      ingredient1 = Ingredient.create!(name: "Sugar", cost: 2)
      ingredient2 = Ingredient.create!(name: "Flour", cost: 5)
      recipe = Recipe.create!(name: "Cookies", complexity: 2, genre: "Baked Goods")
      RecipeIngredient.create!(recipe: recipe, ingredient: ingredient1)
      RecipeIngredient.create!(recipe: recipe, ingredient: ingredient2)

      expect(recipe.total_cost).to eq(7)
    end
  end
end