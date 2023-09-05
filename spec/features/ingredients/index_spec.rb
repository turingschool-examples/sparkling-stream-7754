require 'rails_helper'

RSpec.describe 'ingredients index', type: :feature do
  before (:each) do 
    load_test_data
  end
  
  it 'provides a list of all the ingredients including their name and cost' do
    visit '/ingredients'

    expect(page).to have_content('Ground Beef: $5')
    expect(page).to have_content('Penne: $2')
    expect(page).to have_content('Tomato: $3')
    expect(page).to have_content('Cheese: $4')
    expect(page).to have_content('Buns: $2')
    expect(page).to have_content('Rice: $3')
    expect(page).to have_content('Fish: $6')
  end
end