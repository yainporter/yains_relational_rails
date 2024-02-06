require "rails_helper"

RSpec.describe "Descendent Edit Page", type: :feature do
  before(:each) do
    @porters = Family.create!(name: "Porter")
    @schnepf = Family.create!(name: "Schnepf")
    @marlane = Descendent.create(first_name: "Marlane", family_id: @porters.id, female: true, languages_spoken: 1)

    visit descendents_edit_path(@marlane.id)
  end

  describe "User Story 14 - Descendent Update" do
    it "has a form to edit the Descendent's attributes" do
      expect(page).to have_field("First Name:")
      expect(page).to have_field("Family ID:")
      expect(page).to have_field("True")
      expect(page).to have_field("False")
      expect(page).to have_field("Languages Spoken:")
      expect(page).to have_button("Update Descendent")

      fill_in "First Name:", with: "Mary"
      fill_in "Family ID:", with: @schnepf.id
      choose("True")
      fill_in "Languages Spoken:", with: 2
      click_button "Update Descendent"

      expect(page.current_path).to eq(descendents_show_path(@marlane.id))

      expect(page).to have_content("Mary")
      expect(page).to have_content("Last Name: Schnepf")
      expect(page).to have_content("Family ID: #{@schnepf.id}")
      expect(page).to have_content("Female: true")
      expect(page).to have_content("Languages Spoken: 2")
    end
  end

  describe "Extra Functionality 2 - Flash" do
    it "will give a flash message when no fields are filled out" do
      click_button "Update Descendent"

      expect(page).to have_content("Descendent not updated: Please fill out a field to update")
    end

    it "will render :edit on families_update_path" do
      click_button "Update Descendent"

      expect(page.current_path).to eq(descendents_update_path(@marlane))
    end
  end
end
