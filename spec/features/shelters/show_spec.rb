require 'rails_helper'

# As a visitor
# When I visit '/shelters/:id'
# Then I see the shelter with that id including the shelter's:
# - name
# - address
# - city
# - state
# - zip

RSpec.describe "shelter show page", type: :feature do
  it "shows given shelter's name, address, city, state, and zip" do
    shelter_1 = Shelter.create(name:        "Good Boys Are Us",
                               address:     "1234 ABC Street",
                               city:        "Denver",
                               state:       "Colorado",
                               zip:         80202)


    shelter_2 = Shelter.create(name:        "I Don't Bite Hard",
                               address:     "4321 CBA Street",
                               city:        "Revned",
                               state:       "Colorado",
                               zip:         80202)

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_1.zip)

    expect(page).to_not have_content(shelter_2.name)

  end
end
