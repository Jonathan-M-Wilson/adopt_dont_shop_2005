require 'rails_helper'

RSpec.describe "pet update page", type: :feature do
  it "allows you to update pet information" do

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

    click_on "Update Pet"

    expect(current_path).to eq("/pets/#{pet_3.id}/edit")

    fill_in :name, with: "Sokka of the Southern Water Tribe"
    fill_in :approximate_age, with: 3.2

    click_on 'Save'
    
    expect(current_path).to eq("/pets/#{pet_3.id}")
    page.has_content?('Sokka of the Southern Water Tribe')
  end
end
