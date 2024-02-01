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

    @stacee_and_aaron = Relationship.create(mom_id: @stacee.id, dad_id: @aaron.id)
    @amy_and_rich = Relationship.create(mom_id: @amy.id, dad_id: @rich.id, married: false)
    @alissa_and_joe = Relationship.create(mom_id: @alissa.id, dad_id: @joe.id)
    @dana_and_travis = Relationship.create(mom_id: @dana.id, dad_id: @travis.id)
    @brittney_and_justin = Relationship.create(mom_id: @brittney.id, dad_id: @justin.id)
    @amanda_and_lee = Relationship.create(mom_id: @amanda.id, dad_id: @lee.id)
    @yain_and_rusty = Relationship.create(mom_id: @yain.id, dad_id: @rusty.id)

    visit families_show_path(@porters.id)
  end

  describe "User Story 2 - Family Show" do
    it "shows the Family's page including all of its attributes" do
      expect(page).to have_content("Family ID: #{@porters.id}")
      expect(page).to have_content("#{@porters.id}")
    end
  end

  describe "User Story 7 - Parent Child Count" do
    it "displays the number of children associated with the parent" do
      expect(page).to have_content("Number of Porter descendents: 10")

      visit families_show_path(@lines.id)
      expect(page).to have_content("Number of Lines descendents: 2")
    end
  end
end
