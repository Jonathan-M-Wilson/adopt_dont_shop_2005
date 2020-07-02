require 'rails_helper'

RSpec.describe "pets index page", type: :feature do
  it "can see each pet in system including the pets image, name, age, sex, and name of shelter the pet is located" do
    pet_1 = Pet.create(image:            "Good Boys Are Us",
                       name:             "Samson",
                       approximate_age:  4.5,
                       sex:              "Male",
                       sheltered_at:     "Good Boys Are Us")


    pet_2 = Pet.create(image:            "I Don't Bite Hard",
                       name:             "Delilah",
                       approximate_age:  4.0,
                       sex:              "Female",
                       sheltered_at:     "I Don't Bite Hard")

    visit '/pets'

    expect(page).to have_content(pet_1.name)
    expect(page).to have_content(pet_1.sheltered_at)
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
