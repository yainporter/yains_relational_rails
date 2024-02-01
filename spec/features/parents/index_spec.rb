require 'rails_helper'

RSpec.describe 'Parent Index Page', type: :feature do
  before(:each) do
    @porters = Family.create!(last_name: "Porter")
    @finders = Family.create!(last_name: "Finders")
    @lines = Family.create!(last_name: "Lines")
    @burnett = Family.create!(last_name: "Burnett")
    @pini = Family.create!(last_name: "Pini")
    @jones = Family.create!(last_name: "Jones")
    @saechao = Family.create!(last_name: "Saechao")

    @marlane = Descendent.create(first_name: "Marlane", family_id: @porters.id, female: true, languages_spoken: 1)
    @don = Descendent.create(first_name: "Don", family_id: @porters.id, female: false, languages_spoken: 2)

    @marlane_and_don = Parent.create(mother_id: @marlane.id, father_id: @don.id, married: true)
    @aaron = Descendent.create(first_name: "Aaron", family_id: @porters.id, female: false, parents_id: @marlane_and_don.id, languages_spoken: 1)
    @stacee = Descendent.create(first_name: "Stacee", family_id: @porters.id, female: true, parents_id: @marlane_and_don.id, languages_spoken: 1)
    @amy = Descendent.create(first_name: "Amy", family_id: @finders.id, female: true, parents_id: @marlane_and_don.id, languages_spoken: 1)
    @rich = Descendent.create(first_name: "Rich", family_id: @finders.id, female: false, languages_spoken: 1)
    @alissa = Descendent.create(first_name: "Alissa", family_id: @lines.id, female: true, parents_id: @marlane_and_don.id, languages_spoken: 1)
    @joe = Descendent.create(first_name: "Joe", family_id: @lines.id, female: false, languages_spoken: 1)
    @dana = Descendent.create(first_name: "Dana", family_id: @burnett.id, female: true, languages_spoken: 2)
    @travis = Descendent.create(first_name: "Travis", family_id: @burnett.id, female: false, languages_spoken: 1)
    @justin = Descendent.create(first_name: "Justin", family_id: @porters.id, female: false, parents_id: @marlane_and_don.id, languages_spoken: 1)
    @brittney = Descendent.create(first_name: "Brittney", family_id: @porters.id, female: true, languages_spoken: 1)
    @lee = Descendent.create(first_name: "Lee", family_id: @porters.id, female: false, parents_id: @marlane_and_don.id, languages_spoken: 2)
    @amanda = Descendent.create(first_name: "Amanda", family_id: @porters.id, female: true, languages_spoken: 1)
    @rusty = Descendent.create(first_name: "Rusty", family_id: @porters.id, female: false, parents_id: @marlane_and_don.id, languages_spoken: 3)
    @yain = Descendent.create(first_name: "Yain", family_id: @porters.id, female: true, languages_spoken: 3)

    @stacee_and_aaron = Parent.create(mother_id: @stacee.id, father_id: @aaron.id, married: true)
    @amy_and_rich = Parent.create(mother_id: @amy.id, father_id: @rich.id, married: false)
    @alissa_and_joe = Parent.create(mother_id: @alissa.id, father_id: @joe.id, married: true)
    @dana_and_travis = Parent.create(mother_id: @dana.id, father_id: @travis.id, married: true)
    @brittney_and_justin = Parent.create(mother_id: @brittney.id, father_id: @justin.id, married: true)
    @amanda_and_lee = Parent.create(mother_id: @amanda.id, father_id: @lee.id, married: true)
    @yain_and_rusty = Parent.create(mother_id: @yain.id, father_id: @rusty.id, married: true)
  end

  describe 'User Story 1 - Parent Index' do
    it 'has a name of each parent record in the system' do
      visit "/parents"

      expect(page).to have_content("List of Parents:")
      expect(page).to have_content("Marlane and Don")
      expect(page).to have_content("Stacee and Aaron")
      expect(page).to have_content("Amy and Rich")
      expect(page).to have_content("Alissa and Joe")
      expect(page).to have_content("Dana and Travis")
      expect(page).to have_content("Brittney and Justin")
      expect(page).to have_content("Amanda and Lee")
      expect(page).to have_content("Yain and Rusty")
    end
  end
end
