require "rails_helper"

RSpec.describe "Family Descendents Index Page", type: :feature do
  before(:each) do
    @porters = Family.create!(last_name: "Porter")
    @finders = Family.create!(last_name: "Finders")
    @lines = Family.create!(last_name: "Lines")
    @burnett = Family.create!(last_name: "Burnett")
    @pini = Family.create!(last_name: "Pini")
    @jones = Family.create!(last_name: "Jones")
    @saechao = Family.create!(last_name: "Saechao")

    @marlane = Descendent.create(first_name: "Marlane", family_id: @porters.id, female: true, languages_spoken: 1)
    @don = Descendent.create(first_name: "Don", family_id: @porters.id, female: false, languages_spoken: 2)

    @marlane_and_don = Parent.create(mother_id: @marlane.id, father_id: @don.id, married: true)
    @aaron = Descendent.create(first_name: "Aaron", family_id: @porters.id, female: false, parents_id: @marlane_and_don.id, languages_spoken: 1)
    @stacee = Descendent.create(first_name: "Stacee", family_id: @porters.id, female: true, languages_spoken: 1)

    visit family_descendents_path(@marlane_and_don.id)
  end

  describe "User Story 5 - Family Descendents Index" do
    it "displays each descendent in the system, including its attributes" do
      expect(page).to have_content("First Name: Aaron")
      expect(page).to have_content("Last Name: Porter")
      expect(page).to have_content("family ID: #{@porters.id}")
      expect(page).to have_content("Female: false")
      expect(page).to have_content("Languages Spoken: 1")

    end
  end
end
