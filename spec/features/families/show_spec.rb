require "rails_helper"

RSpec.describe "Family Show Page", type: :feature do
  before(:each) do
    @porter = Family.create!(name: "Porter")
    @finder = Family.create!(name: "Finder")
    @lines = Family.create!(name: "Lines")
    @burnett = Family.create!(name: "Burnett")
    @pini = Family.create!(name: "Pini")

    @marlane = Descendent.create(first_name: "Marlane", family_id: @porter.id, female: true, languages_spoken: 1)
    @don = Descendent.create(first_name: "Don", family_id: @porter.id, female: false, languages_spoken: 2)

    @marlane_and_don = Relationship.create(mom_id: @marlane.id, dad_id: @don.id)

    @aaron = Descendent.create(first_name: "Aaron", family_id: @porter.id, female: false, languages_spoken: 1, parents_id: @marlane_and_don.id)
    @stacee = Descendent.create(first_name: "Stacee", family_id: @porter.id, female: true, languages_spoken: 1)
    @alissa = Descendent.create(first_name: "Alissa", family_id: @lines.id, female: true, languages_spoken: 1, parents_id: @marlane_and_don.id)
    @joe = Descendent.create(first_name: "Joe", family_id: @lines.id, female: false, languages_spoken: 1)

    visit families_show_path(@porter.id)
  end

  describe "User Story 2 - Family Show" do
    it "shows the Family's page including all of its attributes" do
      expect(page).to have_content("Family ID: #{@porter.id}")
      expect(page).to have_content("#{@porter.id}")
    end
  end

  describe "User Story 7 - Parent Child Count" do
    it "displays the number of children associated with the parent" do


      expect(page).to have_content("Number of Porter descendents: 4")

      visit families_show_path(@lines.id)
      expect(page).to have_content("Number of Lines descendents: 2")
    end
  end

  describe "User Story 10 - Family Descendents Index Link" do
    it "has a link to the family's descendents page" do
      expect(page).to have_link("Descendents", href: family_descendents_path(@porter.id))
    end
  end

  describe "User Story 12 - Family Update" do
    it "has a link to update the Family" do
      expect(page).to have_link("Edit Family Information")

      click_link("Edit Family Information")

      expect(page.current_path).to eq(families_edit_path(@porter.id))
    end
  end

  describe "User Story 19 - Parent Delete" do
    it "has a link to delete parent and all child records" do
      expect(page).to have_link("Delete Family", href: families_delete_path(@porter.id))

      click_link("Delete Family")

      expect(page.current_path).to eq(families_path)

      expect(page).to have_no_content("Porter")
    end
  end
end
