require 'rails_helper'

RSpec.describe "shelter index page", type: :feature do
  it "can see the names of each shelter in the system" do
    shelter_1 = Shelter.create(title:       "Good Boys Are Us")

    shelter_2 = Shelter.create(title:       "I Don't Bite Hard")

    visit '/shelters'

    expect(page).to have_content(shelter_1.title)
    expect(page).to have_content(shelter_2.title)
  end
end
