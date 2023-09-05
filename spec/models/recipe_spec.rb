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
    describe "#get_ingredient_names" do
      it "returns all ingredient names associated with the recipe" do
        recipe_1 = Recipe.create!(name: "Oops, all Beef!", complexity: 1, genre: "Horrible")
        ingredient_1 = recipe_1.ingredients.create!(name: "Ground Beef", cost: 2)
        ingredient_2 = recipe_1.ingredients.create!(name: "Salt", cost: 4)

        expect(recipe_1.get_ingredient_names).to eq([ingredient_1.name, ingredient_2.name])
      end
    end

    describe "#recipe_cost" do
      it "returns the total cost of all ingredients associated with the recipe" do
        recipe_1 = Recipe.create!(name: "Oops, all Beef!", complexity: 1, genre: "Horrible")
        ingredient_1 = recipe_1.ingredients.create!(name: "Ground Beef", cost: 2)
        ingredient_2 = recipe_1.ingredients.create!(name: "Salt", cost: 4)

        expect(recipe_1.recipe_cost).to eq(6)
      end
    end
  end
end