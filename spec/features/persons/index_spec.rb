require "rails_helper"

RSpec.describe "Persons Index Page", type: :feature do
  before(:each) do
    @porters = Surname.create!(last_name: "Porter")
    @finders = Surname.create!(last_name: "Finders")
    @lines = Surname.create!(last_name: "Lines")
    @burnett = Surname.create!(last_name: "Burnett")
    @pini = Surname.create!(last_name: "Pini")
    @jones = Surname.create!(last_name: "Jones")
    @saechao = Surname.create!(last_name: "Saechao")

    @marlane = Person.create(first_name: "Marlane", surname_id: @porters.id, female: true, languages_spoken: 1)
    @don = Person.create(first_name: "Don", surname_id: @porters.id, female: false, languages_spoken: 2)

    @marlane_and_don = Parent.create(mother_id: @marlane.id, father_id: @don.id, married: true)
    @aaron = Person.create(first_name: "Aaron", surname_id: @porters.id, female: false, parents_id: @marlane_and_don.id, languages_spoken: 1)
    @stacee = Person.create(first_name: "Stacee", surname_id: @porters.id, female: true, parents_id: @marlane_and_don.id, languages_spoken: 1)

    visit "/persons"
  end

  describe "User Story 3 - Child Index" do
    it "displays each person in the system, including its attributes" do
      expect(page).to have_content("First Name: Marlane")
      expect(page).to have_content("Last Name: Porter")
      expect(page).to have_content("Surname ID: #{@porters.id}")
      expect(page).to have_content("Female: true")
      expect(page).to have_content("Languages Spoken: 1")

      expect(page).to have_content("First Name: Don")
      expect(page).to have_content("Last Name: Porter")
      expect(page).to have_content("Surname ID: #{@porters.id}")
      expect(page).to have_content("Female: false")
      expect(page).to have_content("Languages Spoken: 2")
    end
  end
end
