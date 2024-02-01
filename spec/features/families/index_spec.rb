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
    @schnepf = Family.create!(name: "Schnepf")
    @edmunds = Family.create!(name: "Edmunds")

    visit families_path
  end

  describe 'User Story 1 - Families Index' do
    it 'has a name of each family record in the system' do

      expect(page).to have_content("List of Families:")
      expect(page).to have_content("Porter")
      expect(page).to have_content("Finder")
      expect(page).to have_content("Lines")
      expect(page).to have_content("Burnett")
      expect(page).to have_content("Edmunds")
      expect(page).to have_content("Jones")
      expect(page).to have_content("Saechao")
      expect(page).to have_content("Pini")
      expect(page).to have_content("Schnepf")
    end
  end
end
