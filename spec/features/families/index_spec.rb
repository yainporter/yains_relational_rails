require 'rails_helper'

RSpec.describe 'Families Index Page', type: :feature do
  before(:each) do
    @porters = Family.create!(name: "Porter")
    @finder = Family.create!(name: "Finder")
    @lines = Family.create!(name: "Lines")
    @burnett = Family.create!(name: "Burnett")
    @pini = Family.create!(name: "Pini")
    @jones = Family.create!(name: "Jones")
    @saechao = Family.create!(name: "Saechao")

    visit families_path
  end

  describe 'User Story 1 - Families Index' do
    it 'has a name of each family record in the system' do

      expect(page).to have_content("List of Families:")
      expect(page).to have_content("Porter")
      expect(page).to have_content("Finder")
      expect(page).to have_content("Lines")
      expect(page).to have_content("Burnett")
      expect(page).to have_content("Jones")
      expect(page).to have_content("Saechao")
      expect(page).to have_content("Pini")
    end
  end

  describe "User Story 6 - Parent Children Index" do
    it "displays records that are ordered by most recently created first" do
      expect("Porter").to appear_before("Finder")
      expect("Finder").to appear_before("Lines")
      expect("Lines").to appear_before("Burnett")
      expect("Pini").to appear_before("Jones")
      expect("Jones").to appear_before("Saechao")
    end

    it "displays when the record was created next to each of the records" do
      within "#family-#{@porters.id}" do
        expect(page).to have_content("Created at: #{@porters.created_at}")
      end
      within "#family-#{@finder.id}" do
        expect(page).to have_content("Created at: #{@finder.created_at}")
      end
      within "#family-#{@lines.id}" do
        expect(page).to have_content("Created at: #{@lines.created_at}")
      end
    end
  end

  describe "User Story 9 - Families Index Link" do
    it "has a link at the top of any page that takes me to the Families Index" do
      expect(page).to have_link("Families Index", href: families_path)

      visit descendents_path

      expect(page).to have_link("Families Index", href: families_path)
    end
  end
end
