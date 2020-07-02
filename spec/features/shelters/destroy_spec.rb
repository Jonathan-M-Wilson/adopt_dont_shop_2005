require 'rails_helper'

RSpec.describe 'As a Visitor' do
  it 'I can delete a shelter' do
    shelter_1 = Shelter.create(name:       "Good Boys Are Us",
                               address:     "1234 ABC Street",
                               city:        "Denver",
                               state:       "Colorado",
                               zip:         80202)

    visit '/shelters'

    click_button 'Delete'

    expect(current_path).to eq('/shelters')
    expect(page).to_not have_content(shelter_1.name)
    expect(page).to_not have_button('Delete')
  end
end
