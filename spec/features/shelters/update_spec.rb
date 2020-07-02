require 'rails_helper'

RSpec.describe "shelter update page", type: :feature do
  it "allows you to update shelter information" do

    shelter_1 = Shelter.create(name:       "Good Boys Are Us",
                               address:     "1234 ABC Street",
                               city:        "Denver",
                               state:       "Colorado",
                               zip:         80202)

    visit '/shelters'

    click_on "Edit #{shelter_1.name}"

    expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")

    fill_in :name, with: "Good Boys Are Us"
    fill_in :address, with: "1234 ABC Street"
    fill_in :city, with: "Denver"
    fill_in :state, with: "Colorado"
    fill_in :zip, with: 80202

    click_on 'Update Shelter'
    expect(current_path).to eq("/shelters")
    page.has_content?('Good Boys Are Us')
  end
end


# As a visitor
# When I visit a shelter show page
# Then I see a link to update the shelter "Update Shelter"
# When I click the link "Update Shelter"
# Then I am taken to '/shelters/:id/edit' where I  see a form to edit the shelter's data including:
# - name
# - address
# - city
# - state
# - zip
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/shelters/:id',
# the shelter's info is updated,
# and I am redirected to the Shelter's Show page where I see the shelter's updated info
