# As a visitor
# When I visit '/pets/:id'
# Then I see the pet with that id including the pet's:
# - image
# - name
# - description
# - approximate age
# - sex
# - adoptable/pending adoption status


require 'rails_helper'

RSpec.describe "pets show page", type: :feature do
  it "can see the pet with that id including the pet's image, name, age, sex, and name of shelter the pet is located" do

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
                       description:         "The best boy",
                       shelter_id:          shelter_1.id,
                       status:              "pending adoption")


    pet_2 = Pet.create!(image:              "https://i.pinimg.com/736x/3f/47/7f/3f477ff92627ba171fcc867f23285cf5.jpg",
                       name:                "Delilah",
                       approximate_age:     4.0,
                       sex:                 "Female",
                       description:         "The best girl",
                       shelter_id:          shelter_1.id,
                       status:              "adoptable")

    pet_3 = Pet.create!(image:               "https://cdn0.wideopenpets.com/wp-content/uploads/2019/03/Untitled-design-2019-03-27T180734.510-770x405.jpg",
                        name:                "Sokka",
                        approximate_age:     3.0,
                        sex:                 "Male",
                        description:         "The best boy",
                        shelter_id:          shelter_2.id,
                        status:              "adoptable")

    visit "/pets/#{pet_3.id}"

    expect(page).to have_content("Sokka")
    expect(page).to have_content("Sex: #{pet_3.sex}")
    expect(page).to have_content("The best boy")
    expect(page).to have_content("Status: adoptable")
  end
end
