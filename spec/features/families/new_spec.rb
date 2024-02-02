require "rails_helper"

RSpec.describe "Family Show Page", type: :feature do
  before(:each) do
    @porters = Family.create!(name: "Porter")
    @finder = Family.create!(name: "Finder")
    @lines = Family.create!(name: "Lines")
    @burnett = Family.create!(name: "Burnett")
    @pini = Family.create!(name: "Pini")
    @jones = Family.create!(name: "Jones")
    @saechao = Family.create!(name: "Saechao")
    @gillespie = Family.create!(name: "Gillespie")
    @taylor = Family.create!(name: "Taylor")
    @schnepf = Family.create!(name: "Schnepf")
    @edmunds = Family.create!(name: "Edmunds")

    visit families_new_path
  end

  describe "User Story 11 - Family Creation" do
    it "has a form on the new family page" do
      expect(page).to have_no_content("Taylor")

      visit families_new_path

      expect(page).to have_content("Family Name:")

      fill_in "Family Name:", with: "Taylor"

      expect(page).to have_button("Create Family")

      click_button "Create Family"

      expect(page.current_path).to eq(families_path)

      expect(page).to have_content("Taylor")
    end
  end
end
