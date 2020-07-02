require 'rails_helper'

RSpec.describe "shelter creation page", type: :feature do
  it "takes you to a form to create a new shelter" do

    visit '/shelters'

    click_on 'New Shelter'

    expect(current_path).to eq('/shelters/new')

    fill_in :name, with: "Good Boys Are Us"
    fill_in :address, with: "1234 ABC Street"
    fill_in :city, with: "Denver"
    fill_in :state, with: "Colorado"
    fill_in :zip, with: 80202

    click_on 'Create Shelter'
    expect(current_path).to eq("/shelters")
    page.has_content?('Good Boys Are Us')
  end
end

# When I visit the Shelter Index page
# Then I see a link to create a new Shelter, "New Shelter"
# When I click this link
# Then I am taken to '/shelters/new' where I  see a form for a new shelter
# When I fill out the form with a new shelter's:
# - name
# - address
# - city
# - state
# - zip
# And I click the button "Create Shelter" to submit the form
# Then a `POST` request is sent to '/shelters',
# a new shelter is created,
# and I am redirected to the Shelter Index page where I see the new Shelter listed.
