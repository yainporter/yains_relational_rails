require "rails_helper"

RSpec.describe "Families New Page", type: :feature do
  before(:each) do
    @porters = Family.create!(name: "Porter")
    @finder = Family.create!(name: "Finder")
    @lines = Family.create!(name: "Lines")
    @burnett = Family.create!(name: "Burnett")
    @pini = Family.create!(name: "Pini")
    @jones = Family.create!(name: "Jones")
    @saechao = Family.create!(name: "Saechao")

    visit families_new_path
  end

  describe "User Story 11 - Family Creation" do
    it "has a form on the new family page" do
      visit families_path

      expect(page).to have_no_content("Taylor")

      visit families_new_path

      expect(page).to have_field("Family Name:")

      fill_in "Family Name:", with: "Taylor"

      expect(page).to have_button("Create Family")

      click_button "Create Family"

      expect(page.current_path).to eq(families_path)

      expect(page).to have_content("Taylor")
    end
  end

  describe "Extra Functionality 2 - Flash" do
    it "will give a flash message when all fields are not filled out" do
      click_button "Create Family"

      expect(page).to have_content("Family not created: Please fill out Family Name")
    end

    it "will render :new on families_create_path" do
      click_button "Create Family"

      expect(page.current_path).to eq(families_create_path)
    end
  end
end
