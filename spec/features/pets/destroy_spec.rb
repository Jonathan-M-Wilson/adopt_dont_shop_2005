require 'rails_helper'

RSpec.describe 'As a Visitor' do
  it 'can delete a pet then redirect to pets index' do
    shelter_1 = Shelter.create(name:         "Good Boys Are Us",
                               address:      "1234 ABC Street",
                               city:         "Denver",
                               state:        "Colorado",
                               zip:          80202)

    pet_3 = Pet.create!(image:               "https://cdn0.wideopenpets.com/wp-content/uploads/2019/03/Untitled-design-2019-03-27T180734.510-770x405.jpg",
                        name:                "Sokka",
                        approximate_age:     3.0,
                        sex:                 "Male",
                        shelter_id:          shelter_1.id)

    visit "/pets/#{pet_3.id}"

    expect(page).to have_content("Sokka")

    click_on "Delete Pet"
    expect(current_path).to eq("/pets")

    expect(page).to_not have_content("Sokka")
  end
end
