require "rails_helper"

RSpec.describe "Family Edit Page", type: :feature do
  before(:each) do
    @porters = Family.create!(name: "Porter")
    @finder = Family.create!(name: "Finder")

    visit families_edit_path(@porters.id)
  end

  describe "User Story 12 - Family Update" do
    it "has a form to edit the Family's attributes" do
      expect(page).to have_field("Edit Family Name")
      fill_in "Edit Family Name", with: "Porter!!"

      expect(page).to have_button("Update Family")
      click_button("Update Family")

      expect(page.current_path).to eq(families_show_path(@porters.id))
      expect(page).to have_content("Porter!!")
    end
  end

  describe "Extra Functionality 2 - Flash" do
    it "will give a flash message when all fields are not filled out" do
      click_button "Update Family"
      expect(page).to have_content("Family not updated: Please fill out Family Name")
    end

    it "will render :edit on families_update_path" do
      click_button "Update Family"

      expect(page.current_path).to eq(families_update_path(@porters))
    end
  end
end
