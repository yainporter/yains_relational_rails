require 'rails_helper'

RSpec.describe 'Families Index Page', type: :feature do
  before(:each) do
    @porter = Family.create!(name: "Porter")
    @finder = Family.create!(name: "Finder")
    @lines = Family.create!(name: "Lines")
  @burnett = Family.create!(name: "Burnett")
    @pini = Family.create!(name: "Pini")
    @jones = Family.create!(name: "Jones")
    @saechao = Family.create!(name: "Saechao")


    @marlane = Descendent.create(first_name: "Marlane", family_id: @porter.id, female: true, languages_spoken: 1)
    @don = Descendent.create(first_name: "Don", family_id: @porter.id, female: false, languages_spoken: 2)
    @aaron = Descendent.create(first_name: "Aaron", family_id: @porter.id, female: false, languages_spoken: 1)
    @stacee = Descendent.create(first_name: "Stacee", family_id: @porter.id, female: true, languages_spoken: 1)
    @amy = Descendent.create(first_name: "Amy", family_id: @finder.id, female: true, languages_spoken: 1)
    @rich = Descendent.create(first_name: "Rich", family_id: @finder.id, female: false, languages_spoken: 1)
    @alissa = Descendent.create(first_name: "Alissa", family_id: @lines.id, female: true, languages_spoken: 1)
    @joe = Descendent.create(first_name: "Joe", family_id: @lines.id, female: false, languages_spoken: 1)
    @cami = Descendent.create(first_name: "Cami", family_id: @lines.id, female: true)
    @justin = Descendent.create(first_name: "Justin", family_id: @lines.id, female: false, languages_spoken: 1)
    @brittney = Descendent.create(first_name: "Brittney", family_id: @lines.id, female: true, languages_spoken: 1)
    @lee = Descendent.create(first_name: "Lee", family_id: @porter.id, female: false, languages_spoken: 2)
    @amanda = Descendent.create(first_name: "Amanda", family_id: @porter.id, female: true, languages_spoken: 1)
    @rusty = Descendent.create(first_name: "Rusty", family_id: @finder.id, female: false, languages_spoken: 3)
    @yain = Descendent.create(first_name: "Yain", family_id: @porter.id, female: true, languages_spoken: 3)

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

      expect("Saechao").to appear_before("Jones")
      expect("Jones").to appear_before("Pini")
      expect("Pini").to appear_before("Lines")
      expect("Lines").to appear_before("Finder")
      expect("Finder").to appear_before("Porter")
    end

    it "displays when the record was created next to each of the records" do
      within "#family-#{@porter.id}" do
        expect(page).to have_content("Created at: #{@porter.created_at}")
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

  describe "User Story 11 - Family Creation" do
    it "has a link to create a new family" do
      expect(page).to have_link("Add Family", href: families_new_path)

      click_link("Add Family")

      expect(page.current_path).to eq(families_new_path)
    end
  end

  describe "User Story 17 - Family Update from Family Index" do
    it "has a link to edit each Family's information" do
      within "#family-#{@porter.id}" do
        expect(page).to have_content("Porter")
        expect(page).to have_link("Edit", href: families_edit_path(@porter))
      end
    end
  end

  describe "User Story 22 - Family Delete From Family Index" do
    it "has a link next to every Family to delete its record" do
      families = Family.all
      families.each do |family|
        within "#family-#{family.id}" do
          expect(page).to have_link("Delete", href: families_delete_path(family))

          if @porter.id
            click_link("Delete")
            expect(page.current_path).to eq(families_path)
          end
        end
      end
      expect(page).to_not have_selector("#family-#{@porter.id}")
    end
  end

  describe "Extension 1 - Sort Families by Number of Descendents" do
    it "has a link to filter families by descendents count" do
      expect(page).to have_link("Sort Families by Number of Descendents", href: families_path(sort: true))

      click_link("Sort Families by Number of Descendents")
      expect(page.current_path).to eq(families_path)
      families = Family.all
      families.each do |family|
        within "#family-#{family.id}" do
          expect(page).to have_content(family.descendents.count)
        end
      end

      expect("Porter").to appear_before("Lines")
      expect("Lines").to appear_before("Finder")
    end
  end

  describe "Extension 2 - Search by name (exact match)" do
    it "has a keyword filter" do
      expect(page).to have_field(:keyword)
      expect(page).to have_button("Search")
      within ".keyword-search" do
        fill_in(:keyword, with: "Pini")
        click_button("Search")
      end

      expect(page.current_path).to eq(families_path)
      expect(page).to have_no_content("Porter")
      expect(page).to have_no_content("Finder")
      expect(page).to have_no_content("Lines")
      expect(page).to have_no_content("Burnett")
      expect(page).to have_no_content("Jones")
      expect(page).to have_no_content("Saechao")
      expect(page).to have_content("Pini")
    end
  end

  describe "Extension 3 - Search by name (partial match) " do
    it "has a partial match filter" do
      potter = Family.create!(name: "Potter")

      expect(page).to have_field(:partial_match)

      within ".partial-match" do
        fill_in :partial_match, with: "Po"
        click_button "Search"
      end

      expect(page.current_path).to eq(families_path)
      expect(page).to have_no_content("Finder")
      expect(page).to have_no_content("Lines")
      expect(page).to have_no_content("Burnett")
      expect(page).to have_no_content("Jones")
      expect(page).to have_no_content("Saechao")
      expect(page).to have_no_content("Pini")
      expect(page).to have_content("Potter")
      expect(page).to have_content("Porter")
    end
  end

  describe "Extra functionality 1 - Link to Show Page" do
    it "has a link to each Family's show page" do
      within "#family-#{@porter.id}" do
        expect(page).to have_link("Show Page", href: families_show_path(@porter))

        click_link("Show Page")
        expect(page.current_path).to eq(families_show_path(@porter))
      end
    end
  end
end
