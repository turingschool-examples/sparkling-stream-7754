require "rails_helper"

RSpec.describe Recipe, type: :model do
  before :each do
    @bolognese_recipe = Recipe.create!(name: "Bolognese", complexity: 3, genre: "Italian")

    @beef = Ingredient.create!(name: "Beef", cost: 4)
    @pasta = Ingredient.create!(name: "Pasta", cost: 1)

    @recipe_ingredients_1 = RecipeIngredient.create!(recipe_id: "#{@bolognese_recipe.id}", ingredient_id:"#{@beef.id}")
    @recipe_ingredients_1 = RecipeIngredient.create!(recipe_id: "#{@bolognese_recipe.id}", ingredient_id:"#{@pasta.id}")
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
    it "#ingredient_names" do
      expect(@bolognese_recipe.ingredient_names).to eq(["Beef", "Pasta"])
    end

    it "#ingredients_cost" do
      expect(@bolognese_recipe.ingredients_cost).to eq(5)
    end
  end
end