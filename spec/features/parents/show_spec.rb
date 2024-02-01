require "rails_helper"

RSpec.describe "Parent Show Page", type: :feature do
  before(:each) do
    @porters = Surname.create!(last_name: "Porter")
    @finders = Surname.create!(last_name: "Finders")
    @lines = Surname.create!(last_name: "Lines")
    @burnett = Surname.create!(last_name: "Burnett")
    @pini = Surname.create!(last_name: "Pini")
    @jones = Surname.create!(last_name: "Jones")
    @saechao = Surname.create!(last_name: "Saechao")

    @marlane = Child.create(first_name: "Marlane", surname_id: @porters.id, female: true, languages_spoken: 1)
    @don = Child.create(first_name: "Don", surname_id: @porters.id, female: false, languages_spoken: 2)

    @marlane_and_don = Parent.create(mother_id: @marlane.id, father_id: @don.id, married: true)
    @aaron = Child.create(first_name: "Aaron", surname_id: @porters.id, female: false, parents_id: @marlane_and_don.id, languages_spoken: 1)
    @stacee = Child.create(first_name: "Stacee", surname_id: @porters.id, female: true, parents_id: @marlane_and_don.id, languages_spoken: 1)
    @amy = Child.create(first_name: "Amy", surname_id: @finders.id, female: true, parents_id: @marlane_and_don.id, languages_spoken: 1)
    @rich = Child.create(first_name: "Rich", surname_id: @finders.id, female: false, languages_spoken: 1)
    @alissa = Child.create(first_name: "Alissa", surname_id: @lines.id, female: true, parents_id: @marlane_and_don.id, languages_spoken: 1)
    @joe = Child.create(first_name: "Joe", surname_id: @lines.id, female: false, languages_spoken: 1)
    @dana = Child.create(first_name: "Dana", surname_id: @burnett.id, female: true, languages_spoken: 2)
    @travis = Child.create(first_name: "Travis", surname_id: @burnett.id, female: false, languages_spoken: 1)
    @justin = Child.create(first_name: "Justin", surname_id: @porters.id, female: false, parents_id: @marlane_and_don.id, languages_spoken: 1)
    @brittney = Child.create(first_name: "Brittney", surname_id: @porters.id, female: true, languages_spoken: 1)
    @lee = Child.create(first_name: "Lee", surname_id: @porters.id, female: false, parents_id: @marlane_and_don.id, languages_spoken: 2)
    @amanda = Child.create(first_name: "Amanda", surname_id: @porters.id, female: true, languages_spoken: 1)
    @rusty = Child.create(first_name: "Rusty", surname_id: @porters.id, female: false, parents_id: @marlane_and_don.id, languages_spoken: 3)
    @yain = Child.create(first_name: "Yain", surname_id: @porters.id, female: true, languages_spoken: 3)

    @stacee_and_aaron = Parent.create(mother_id: @stacee.id, father_id: @aaron.id, married: true)
    @amy_and_rich = Parent.create(mother_id: @amy.id, father_id: @rich.id, married: false)
    @alissa_and_joe = Parent.create(mother_id: @alissa.id, father_id: @joe.id, married: true)
    @dana_and_travis = Parent.create(mother_id: @dana.id, father_id: @travis.id, married: true)
    @brittney_and_justin = Parent.create(mother_id: @brittney.id, father_id: @justin.id, married: true)
    @amanda_and_lee = Parent.create(mother_id: @amanda.id, father_id: @lee.id, married: true)
    @yain_and_rusty = Parent.create(mother_id: @yain.id, father_id: @rusty.id, married: true)

    visit parents_show_path(@marlane_and_don.id)
  end

  describe "User Story 2 - Parent Show" do
    it "shows the parent's page including all of its attributes" do
      save_and_open_page
      expect(page).to have_content("Parent ID: #{@marlane_and_don.id}")
      expect(page).to have_content("Mother ID: #{@marlane.id}")
      expect(page).to have_content("Father ID: #{@don.id}")
      expect(page).to have_content("Married: true")
    end
  end
end
