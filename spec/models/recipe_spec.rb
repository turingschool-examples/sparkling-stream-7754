require "rails_helper"

RSpec.describe Recipe, type: :model do
  before(:each) do
    @recipe_1 = Recipe.create!(name: "Spaghetti", complexity: 3, genre: "Italian")
    @recipe_2 = Recipe.create!(name: "Burger", complexity: 1, genre: "American")

    @ingredient_1 = Ingredient.create!(name: "Ground Beef", cost: 2)
    @ingredient_2 = Ingredient.create!(name: "Salt", cost: 4)
    @ingredient_3 = Ingredient.create!(name: "Noodles", cost: 1)
    @ingredient_4 = Ingredient.create!(name: "Tomatoes", cost: 2)
    @ingredient_5 = Ingredient.create!(name: "Burg Bun", cost: 1)

    @spaghetti_1 = RecipeIngredient.create!(recipe: @recipe_1, ingredient: @ingredient_1)
    @spaghetti_2 = RecipeIngredient.create!(recipe: @recipe_1, ingredient: @ingredient_2)
    @spaghetti_3 = RecipeIngredient.create!(recipe: @recipe_1, ingredient: @ingredient_3)
  end

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :complexity}
    it {should validate_presence_of :genre}
  end

  describe "relationships" do
    it {should have_many :recipe_ingredients}
    it {should have_many(:ingredients).through(:recipe_ingredients)}
  end

  describe "instance methods" do
    it "#total_cost" do
      expect(@recipe_1.total_cost).to eq(7)
    end
  end
end