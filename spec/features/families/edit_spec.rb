require "rails_helper"

RSpec.describe "Family Edit Page", type: :feature do
  before(:each) do
    @porters = Family.create!(name: "Porter")
    @finder = Family.create!(name: "Finder")

    visit families_edit_path(@porters.id)
  end

  describe "User Story 12 - Family Update" do
    it "has a form to edit the Family's attributes" do
      expect(page).to have_field("Edit #{@porters.name} Name")
      fill_in "Edit #{@porters.name} Name", with: "Porter!!"

      expect(page).to have_button("Update Family")
      click_button("Update Family")

      expect(page.current_path).to eq(families_show_path(@porters.id))
      expect(page).to have_content("Porter!!")
    end
  end
end
