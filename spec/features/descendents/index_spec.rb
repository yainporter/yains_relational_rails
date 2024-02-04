require "rails_helper"

RSpec.describe "Descendents Index Page", type: :feature do
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

    @marlane = Descendent.create(first_name: "Marlane", family_id: @porters.id, female: true, languages_spoken: 1)
    @don = Descendent.create(first_name: "Don", family_id: @porters.id, female: false, languages_spoken: 2)

    @marlane_and_don = Relationship.create(mom_id: @marlane.id, dad_id: @don.id)

    @aaron = Descendent.create(first_name: "Aaron", family_id: @porters.id, female: false, languages_spoken: 1)
    @stacee = Descendent.create(first_name: "Stacee", family_id: @porters.id, female: true, languages_spoken: 1)
    @amy = Descendent.create(first_name: "Amy", family_id: @finder.id, female: true, languages_spoken: 1)
    @rich = Descendent.create(first_name: "Rich", family_id: @finder.id, female: false, languages_spoken: 1)
    @alissa = Descendent.create(first_name: "Alissa", family_id: @lines.id, female: true, languages_spoken: 1)
    @joe = Descendent.create(first_name: "Joe", family_id: @lines.id, female: false, languages_spoken: 1)
    @dana = Descendent.create(first_name: "Dana", family_id: @burnett.id, female: true, languages_spoken: 2)
    @travis = Descendent.create(first_name: "Travis", family_id: @burnett.id, female: false, languages_spoken: 1)
    @justin = Descendent.create(first_name: "Justin", family_id: @porters.id, female: false, languages_spoken: 1)
    @brittney = Descendent.create(first_name: "Brittney", family_id: @porters.id, female: true, languages_spoken: 1)
    @lee = Descendent.create(first_name: "Lee", family_id: @porters.id, female: false, languages_spoken: 2)
    @amanda = Descendent.create(first_name: "Amanda", family_id: @porters.id, female: true, languages_spoken: 1)
    @rusty = Descendent.create(first_name: "Rusty", family_id: @porters.id, female: false, languages_spoken: 3)
    @yain = Descendent.create(first_name: "Yain", family_id: @porters.id, female: true, languages_spoken: 3)

    visit "/descendents"
  end

  describe "User Story 3 - Descendent Index" do
    it "displays each Descendent in the system, including its attributes" do
      expect(page).to have_content("First Name: Marlane")
      expect(page).to have_content("Last Name: Porter")
      expect(page).to have_content("Family ID: #{@porters.id}")
      expect(page).to have_content("Female: true")
      expect(page).to have_content("Languages Spoken: 1")

      # expect(page).to have_content("First Name: Don")
      # expect(page).to have_content("Last Name: Porter")
      # expect(page).to have_content("Family ID: #{@porters.id}")
      # expect(page).to have_content("Female: false")
      # expect(page).to have_content("Languages Spoken: 2")
    end
  end

  describe "User Story 8 - Descendent Index Link" do
    it "has a link at the top of any page that redirects to the Child Index" do
      expect(page).to have_link("Descendents Index", href: descendents_path)

      visit families_path

      expect(page).to have_link("Descendents Index", href: descendents_path)
    end
  end

  describe "User Story 15 - Descendent Index only shows 'true' Records" do
    it "only displays records where female: true" do
      expect(page).to have_no_content("First Name: Don")
      expect(page).to have_no_content("First Name: Aaron")
      expect(page).to have_no_content("Female: false")
    end
  end

  describe "User Story 18 - Descendent Update from Descendent Index" do
    it "has a link next to every Descendent to update info" do
      within "#descendent-#{@amy.id}" do
        expect(page).to have_content("Amy")
        expect(page).to have_link("Edit", href: descendents_edit_path(@amy.id))

        click_link("Edit")

        expect(page.current_path).to eq(descendents_edit_path(@amy))
      end
    end
  end

  describe "User Story 23 - Descendent Delete From Descendent Index" do
    it "has a link next to every Family to delete its record" do
      descendents = Descendent.where(female: true)
      descendents.each do |descendent|
        within "#descendent-#{descendent.id}" do
          expect(page).to have_link("Delete", href: descendents_delete_path(descendent))

          if @amy.id
            click_link("Delete")
            expect(page.current_path).to eq(descendents_path)
          end
        end
      end
      expect(page).to_not have_selector("#descendent-#{@amy.id}")
    end
  end

  describe "Extension 2 - Search by name (exact match)" do
    it "has a keyword filter" do
      expect(page).to have_field(:keyword)
      expect(page).to have_button("Search")

      within "#descendents-keyword" do
        fill_in(:keyword, with: "Marlane")
        click_button("Search")
      end

      expect(page.current_path).to eq(descendents_path)
      expect(page).to have_no_content("Amy")
      expect(page).to have_no_content("Dana")
      expect(page).to have_no_content("Stacee")
      expect(page).to have_no_content("Alissa")
      expect(page).to have_no_content("Amanda")
      expect(page).to have_no_content("Yain")
      expect(page).to have_content("Marlane")
    end
  end

  describe "Extension 3 - Search by name (partial match) " do
    it "has a partial match filter" do
      mary = Descendent.create!(first_name: "Mary", family_id: @porters.id, female: true, languages_spoken: 1)

      expect(page).to have_field(:partial_match)

      within "#descendents-partial-match" do
        fill_in :partial_match, with: "Ma"
        click_button "Search"
      end

      expect(page.current_path).to eq(descendents_path)
      expect(page).to have_no_content("Amy")
      expect(page).to have_no_content("Dana")
      expect(page).to have_no_content("Stacee")
      expect(page).to have_no_content("Alissa")
      expect(page).to have_no_content("Yain")
      expect(page).to have_content("Marlane")
      expect(page).to have_content("Mary")
      expect(page).to have_content("Amanda")
    end
  end
end
