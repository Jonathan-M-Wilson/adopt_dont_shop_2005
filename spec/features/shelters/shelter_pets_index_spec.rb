require 'rails_helper'

RSpec.describe "shelter pets index", type: :feature do
  it "can see each pet from specific Shelter, including pet's image, name, approx age, and sex" do

    shelter_1 = Shelter.create!(name:        "Good Boys Are Us",
                                address:     "1234 ABC Street",
                                city:        "Denver",
                                state:       "Colorado",
                                zip:         80202)


    shelter_2 = Shelter.create!(name:        "I Don't Bite Hard",
                                address:     "4321 CBA Street",
                                city:        "Revned",
                                state:       "Colorado",
                                zip:         80202)

    pet_1 = Pet.create!(image:               "https://www.vieravet.com/sites/default/files/styles/large/adaptive-image/public/golden-retriever-dog-breed-info.jpg?itok=LCRMRkum",
                        name:                "Samson",
                        approximate_age:     4.5,
                        sex:                 "Male",
                        shelter_id:          shelter_1.id)


    pet_2 = Pet.create!(image:               "https://i.pinimg.com/736x/3f/47/7f/3f477ff92627ba171fcc867f23285cf5.jpg",
                        name:                "Delilah",
                        approximate_age:     4.0,
                        sex:                 "Female",
                        shelter_id:          shelter_1.id)

    pet_3 = Pet.create!(image:               "https://cdn0.wideopenpets.com/wp-content/uploads/2019/03/Untitled-design-2019-03-27T180734.510-770x405.jpg",
                        name:                "Sokka",
                        approximate_age:     3.0,
                        sex:                 "Male",
                        shelter_id:          shelter_2.id)


    visit "/shelters/#{shelter_1.id}/pets"

    expect(page).to have_content("Name: Samson")
    expect(page).to have_content("Sex: #{pet_1.sex}")
    expect(page).to have_content("#{shelter_1.name}")
  end
end
