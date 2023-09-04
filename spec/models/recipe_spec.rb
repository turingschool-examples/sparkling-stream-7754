require "rails_helper"

RSpec.describe Recipe, type: :model do
  before(:each) do
    @onion = Ingredient.create!(name: "Onion", cost: 1)
    @tomato = Ingredient.create!(name: "Tomato", cost: 1)
    @egg = Ingredient.create!(name: "Egg", cost: 2)
    @shakshuka = Recipe.create!(name: "Shakshuka", complexity: 2, genre: "Breakfast")
    RecipeIngredient.create!(recipe_id: @shakshuka.id, ingredient_id: @tomato.id)
        RecipeIngredient.create!(recipe_id: @shakshuka.id, ingredient_id: @onion.id)
        RecipeIngredient.create!(recipe_id: @shakshuka.id, ingredient_id: @egg.id)
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

  describe "#find_ingredients" do
    it "returns all ingredients for a recipe" do

      expect(@shakshuka.find_ingredients).to eq([@onion, @tomato, @egg])
    end
  end

  describe "#find_cost" do
    it "returns cost of ingredients for given recipe" do

      expect(@shakshuka.find_cost).to eq(4)
    end
  end
end