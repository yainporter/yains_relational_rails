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

    @marlane_and_don = Relationship.create(porter_relationship_id: @marlane.id, porter_descendent_id: @don.id, relationship_type: "married", children: true)

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

    @stacee_and_aaron = Relationship.create(porter_relationship_id: @stacee.id, porter_descendent_id: @aaron.id, relationship_type: "married", children: true)
    @amy_and_rich = Relationship.create(porter_relationship_id: @amy.id, porter_descendent_id: @rich.id, relationship_type: "divorced", children: true)
    @alissa_and_joe = Relationship.create(porter_relationship_id: @alissa.id, porter_descendent_id: @joe.id, relationship_type: "married", children: true)
    @dana_and_travis = Relationship.create(porter_relationship_id: @dana.id, porter_descendent_id: @travis.id, relationship_type: "married", children: true)
    @brittney_and_justin = Relationship.create(porter_relationship_id: @brittney.id, porter_descendent_id: @justin.id, relationship_type: "married", children: true)
    @amanda_and_lee = Relationship.create(porter_relationship_id: @amanda.id, porter_descendent_id: @lee.id, relationship_type: "married", children: true)
    @yain_and_rusty = Relationship.create(porter_relationship_id: @yain.id, porter_descendent_id: @rusty.id, relationship_type: "married", children: true)

    visit families_show_path(@porters.id)
  end

  describe "User Story 2 - Family Show" do
    it "shows the Family's page including all of its attributes" do
      expect(page).to have_content("Family ID: #{@porters.id}")
      expect(page).to have_content("#{@porters.id}")
    end
  end
end
