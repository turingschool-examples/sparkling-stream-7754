require "rails_helper"

RSpec.describe Ingredient, type: :model do

   describe "validations" do
      it { should validate_presence_of :name }
      it { should validate_presence_of :cost }
   end

   describe "relationships" do
      it { should have_many :recipe_ingredients }
      it { should have_many(:recipes).through(:recipe_ingredients) }
   end

   describe "extension 2" do
      it 'can sort ingredients alphabetically' do
         flour = Ingredient.create!(name: 'Flour', cost: 1)
         eggs = Ingredient.create!(name: 'Eggs', cost: 2)
         milk = Ingredient.create!(name: 'Milk', cost: 3)

         expect(Ingredient.sort_by_name).to eq([eggs, flour, milk])
      end
   end
end