require "rails_helper"

RSpec.describe "Family Descendents Index Page", type: :feature do
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

    visit family_descendents_path(@porters.id)
  end

  describe "User Story 5 - Family Descendents Index" do
    it "displays each descendent in the system, including its attributes" do
      expect(page).to have_content("First Name: Aaron")
      expect(page).to have_content("Last Name: Porter")
      expect(page).to have_content("Family ID: #{@porters.id}")
      expect(page).to have_content("Female: false")
      expect(page).to have_content("Languages Spoken: 1")

      expect(page).to have_content("First Name: Justin")
      expect(page).to have_content("Last Name: Porter")
      expect(page).to have_content("Family ID: #{@porters.id}")
      expect(page).to have_content("Female: false")
      expect(page).to have_content("Languages Spoken: 1")
    end
  end

  describe "User Story 13 - Family Descendents Creation" do
    it "has a link to add a new Descendent for that Family" do
      expect(page).to have_link("Create New Descendent")

      click_link("Create New Descendent")

      expect(page.current_path).to eq(family_descendents_new_path(@porters.id))
    end
  end

  describe "User Story 16 - Sort Descendents" do
    it "sorts descendents alphabetically" do
      expect("Marlane").to appear_before("Don")
      expect("Justin").to appear_before("Brittney")

      expect(page).to have_link("Sort Descendents Alphabetically")

      click_link("Sort Descendents Alphabetically")

      expect(page.current_path).to eq(family_descendents_path(@porters.id))

      expect("Don").to appear_before("Marlane")
      expect("Brittney").to appear_before("Justin")
      expect("Brittney").to appear_before("Don")
    end
  end

  describe "User Story 21 - Display Records Over a Given Threshold" do
    it "filters Descendents by number of languages" do

      @porters.descendents.each do |descendent|
        expect(page).to have_content(descendent.first_name)
      end

      expect(page).to have_field(:sort_by_languages)
      expect(page).to have_button("Submit")

      fill_in("Sort by Languages Spoken:", with: 2)
      click_button("Submit")

      expect(page.current_path).to eq(family_descendents_path(@porters.id))

      expect(page).to have_content("Rusty")
      expect(page).to have_content("Don")
    end
  end

  describe "Extra Feature - [OLD: User Story 21] - Display Records Over a Given Threshold" do
    it "filters Descendents by number of languages" do

      @porters.descendents.each do |descendent|
        expect(page).to have_content(descendent.first_name)
      end

      expect(page).to have_field(:sort_by)
      expect(page).to have_button("Submit")

      fill_in("Limit Descendents", with: 2)
      click_button("Limit")

      expect(page.current_path).to eq(family_descendents_path(@porters.id))

      expect(page).to have_content("Marlane")
      expect(page).to have_content("Don")

      @porters.descendents[2..-1].each do |descendent|
        expect(page).to have_no_content(descendent.first_name)
      end
    end
  end
end
