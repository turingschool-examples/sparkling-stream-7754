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

  describe "instance methods" do
    it "calculates total cost" do
      recipe = Recipe.create!(name: 'Omlettes', complexity: 1, genre: 'Breakfast')
      cheese = Ingredient.create!(name: 'Cheese', cost: 1)
      eggs = Ingredient.create!(name: 'Eggs', cost: 2)
      bacon = Ingredient.create!(name: 'Bacon', cost: 3)
      RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: cheese.id)
      RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: eggs.id)
      RecipeIngredient.create!(recipe_id: recipe.id, ingredient_id: bacon.id)

      expect(recipe.total_cost).to eq(6)
    end
  end
end