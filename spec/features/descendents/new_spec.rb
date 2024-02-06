require "rails_helper"

RSpec.describe "Family Descendents New Page", type: :feature do
  before(:each) do
    @porters = Family.create!(name: "Porter")

    @marlane = Descendent.create(first_name: "Marlane", family_id: @porters.id, female: true, languages_spoken: 1)
    @don = Descendent.create(first_name: "Don", family_id: @porters.id, female: false, languages_spoken: 2)

    @marlane_and_don = Relationship.create(mom_id: @marlane.id, dad_id: @don.id)

    visit family_descendents_new_path(@porters.id)
  end

  describe "User Story 13 - Parent Child Creation" do
    it "has a form on the new family page" do

      expect(page).to have_content("New Descendent")
      expect(page).to have_field("First Name:")
      expect(page).to have_field("Family ID:")
      expect(page).to have_field("Parents ID:")
      expect(page).to have_field("True")
      expect(page).to have_field("Languages Spoken:")

      fill_in "First Name:", with: "Rusty"
      fill_in "Family ID:", with: @porters.id
      fill_in "Parents ID:", with: @marlane_and_don.id
      choose("False")
      fill_in "Languages Spoken:", with: 3

      expect(page).to have_button("Create Descendent")

      click_button "Create Descendent"

      expect(page.current_path).to eq(family_descendents_path(@porters.id))

      expect(page).to have_content("Rusty")
      expect(page).to have_content("Last Name: Porter")
      expect(page).to have_content("Family ID: #{@porters.id}")
      expect(page).to have_content("Female: false")
      expect(page).to have_content("Languages Spoken: 3")
    end
  end

  describe "Extra Functionality 2 - Flash" do
    it "will give a flash message when all fields are not filled out" do
      click_button "Create Descendent"

      expect(page).to have_content("Descendent not created: Please fill out all fields")
    end

    it "will render :new on family_descendents_create_path" do
      click_button "Create Descendent"

      expect(page.current_path).to eq(family_descendents_create_path(@porters))
    end
  end
end
