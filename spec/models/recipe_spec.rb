require "rails_helper"

RSpec.describe Recipe, type: :model do
  before :each do
    @bec = Recipe.create!(name: "Bacon, Egg, and Cheese", complexity: 2, genre: "Breakfast")
    @bagel = @bec.ingredients.create!(name: "Everything Bagel", cost: 2)
    @egg = @bec.ingredients.create!(name: "Egg (not microwaved)", cost: 1)
    @bacon = @bec.ingredients.create!(name: "Thick-Cut Bacon", cost: 4)
    @cheese = @bec.ingredients.create!(name: "Estate Gouda", cost: 3)
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

  describe "#all_ingredients" do
    it "can list all ingredients" do
      expect(@bec.all_ingredients).to eq("#{@bagel.name}, #{@egg.name}, #{@bacon.name}, #{@cheese.name}")
    end
  end

  describe "#total_cost" do
    it "can give the total cost of all ingredients" do
      expect(@bec.total_cost).to eq(@bagel.cost + @egg.cost + @bacon.cost + @cheese.cost)
    end
  end
end