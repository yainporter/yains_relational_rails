require 'rails_helper'

RSpec.describe 'Descendent Show Page', type: :feature do
  before(:each) do
    @porters = Family.create!(name: "Porter")
    @pini = Family.create!(name: "Pini")


    @marlane = Descendent.create(first_name: "Marlane", family_id: @porters.id, female: true, languages_spoken: 1)
    @don = Descendent.create(first_name: "Don", family_id: @porters.id, female: false, languages_spoken: 2)

    @marlane_and_don = Relationship.create(mom_id: @marlane.id, dad_id: @don.id)

    @aaron = Descendent.create(first_name: "Aaron", family_id: @porters.id, female: false, languages_spoken: 1)
    @stacee = Descendent.create(first_name: "Stacee", family_id: @porters.id, female: true, languages_spoken: 1)

    visit "/descendents/#{@marlane.id}"
  end

  describe 'User Story 4 - Descendent Show' do
    it "displays the Descendent's attributes" do
      expect(page).to have_content("Marlane")
      expect(page).to have_content("Last Name: Porter")
      expect(page).to have_content("Family ID: #{@porters.id}")
      expect(page).to have_content("Female: true")
      expect(page).to have_content("Languages Spoken: 1")
    end
  end

  describe "User Story 14 - Descendent Update" do
    it "has a link to update the Descendent" do
      expect(page).to have_content("Edit Descendent")

      click_link ("Edit Descendent")

      expect(page.current_path).to eq(descendents_edit_path(@marlane))
    end
  end
end
