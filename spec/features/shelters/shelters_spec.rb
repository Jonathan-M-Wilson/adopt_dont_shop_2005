require 'rails_helper'

# As a visitor
# When I visit '/shelters'
# Then I see the name of each shelter in the system


RSpec.describe "shelter index page", type: :feature do
  it "can see the names of each shelter in the system" do
    shelter_1 = Shelter.create(name:       "Good Boys Are Us")

    shelter_2 = Shelter.create(name:       "I Don't Bite Hard")

    visit '/shelters'

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end
end
