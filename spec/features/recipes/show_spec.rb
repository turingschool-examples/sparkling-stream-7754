require 'rails_helper'

RSpec.describe 'recipes show', type: :feature do
  before (:each) do 
    load_test_data
  end

  it 'provides the recipes name, complexity, and genre & a list of the names of the ingrediest for the recipe' do
    visit "/recipes/#{@pasta.id}"

    expect(page).to have_content('Pasta')
    expect(page).to have_content('Complexity: 2')
    expect(page).to have_content('Genre: Italian')
    expect(page).to have_content('Ground Beef')
    expect(page).to have_content('Penne')
    expect(page).to have_content('Tomato')
  end
end
