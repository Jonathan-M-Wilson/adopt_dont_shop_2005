require 'rails_helper'

RSpec.describe "pets index page", type: :feature do
  it "can see each pet in system including the pets image, name, age, sex, and name of shelter the pet is located" do

    shelter_1 = Shelter.create!(name:       "Good Boys Are Us",
                               address:     "1234 ABC Street",
                               city:        "Denver",
                               state:       "Colorado",
                               zip:         80202)


    shelter_2 = Shelter.create!(name:       "I Don't Bite Hard",
                               address:     "4321 CBA Street",
                               city:        "Revned",
                               state:       "Colorado",
                               zip:         80202)

    pet_1 = Pet.create!(image:              "https://www.vieravet.com/sites/default/files/styles/large/adaptive-image/public/golden-retriever-dog-breed-info.jpg?itok=LCRMRkum",
                       name:                "Samson",
                       approximate_age:     4.5,
                       sex:                 "Male",
                       shelter_id:          shelter_1.id)


    pet_2 = Pet.create!(image:              "https://i.pinimg.com/736x/3f/47/7f/3f477ff92627ba171fcc867f23285cf5.jpg",
                       name:                "Delilah",
                       approximate_age:     4.0,
                       sex:                 "Female",
                       shelter_id:          shelter_1.id)

    visit '/pets'

    expect(page).to have_content("Name: Samson")
    expect(page).to have_content("Sex: #{pet_1.sex}")
    expect(page).to have_content("Good Boys Are Us")
  end
end

# As a visitor
# When I visit '/pets'
# Then I see each Pet in the system including the Pet's:
# - image
# - name
# - approximate age
# - sex
# - name of the shelter where the pet is currently located
