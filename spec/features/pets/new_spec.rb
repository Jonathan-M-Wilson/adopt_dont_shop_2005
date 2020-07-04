require 'rails_helper'

RSpec.describe "pet creation page", type: :feature do
  it "allows you to see a link to add a new adoptable pet for that shelter" do

    shelter_1 = Shelter.create!(name:       "Good Boys Are Us",
                                address:     "1234 ABC Street",
                                city:        "Denver",
                                state:       "Colorado",
                                zip:         80202)


    visit "/shelters/#{shelter_1.id}/pets"

    click_on 'Create Pet'

    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/new")

    fill_in :image, with: "https://www.petlandlancaster.com/wp-content/uploads/2019/11/1504500_800.jpg"
    fill_in :name, with: "Haley"
    fill_in :description, with: "The best girl"
    fill_in :approximate_age, with: 0.4
    fill_in :sex, with: "Female"


    click_on 'Save Pet'

    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
  end
end
