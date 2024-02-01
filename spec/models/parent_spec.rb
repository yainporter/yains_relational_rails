require "rails_helper"

RSpec.describe "Parent", type: :feature do
  before(:each) do
    @porters = Surname.create!(last_name: "Porter")
    @finders = Surname.create!(last_name: "Finders")
    @lines = Surname.create!(last_name: "Lines")
    @burnett = Surname.create!(last_name: "Burnett")
    @pini = Surname.create!(last_name: "Pini")
    @jones = Surname.create!(last_name: "Jones")
    @saechao = Surname.create!(last_name: "Saechao")

    @marlane = Person.create(first_name: "Marlane", surname_id: @porters.id, female: true, languages_spoken: 1)
    @don = Person.create(first_name: "Don", surname_id: @porters.id, female: false, languages_spoken: 2)

    @marlane_and_don = Parent.create(mother_id: @marlane.id, father_id: @don.id, married: true)
    @aaron = Person.create(first_name: "Aaron", surname_id: @porters.id, female: false, parents_id: @marlane_and_don.id, languages_spoken: 1)
    @stacee = Person.create(first_name: "Stacee", surname_id: @porters.id, female: true, parents_id: @marlane_and_don.id, languages_spoken: 1)
    @amy = Person.create(first_name: "Amy", surname_id: @finders.id, female: true, parents_id: @marlane_and_don.id, languages_spoken: 1)
    @rich = Person.create(first_name: "Rich", surname_id: @finders.id, female: false, languages_spoken: 1)
    @alissa = Person.create(first_name: "Alissa", surname_id: @lines.id, female: true, parents_id: @marlane_and_don.id, languages_spoken: 1)
    @joe = Person.create(first_name: "Joe", surname_id: @lines.id, female: false, languages_spoken: 1)
    @dana = Person.create(first_name: "Dana", surname_id: @burnett.id, female: true, languages_spoken: 2)
    @travis = Person.create(first_name: "Travis", surname_id: @burnett.id, female: false, languages_spoken: 1)
    @justin = Person.create(first_name: "Justin", surname_id: @porters.id, female: false, parents_id: @marlane_and_don.id, languages_spoken: 1)
    @brittney = Person.create(first_name: "Brittney", surname_id: @porters.id, female: true, languages_spoken: 1)
    @lee = Person.create(first_name: "Lee", surname_id: @porters.id, female: false, parents_id: @marlane_and_don.id, languages_spoken: 2)
    @amanda = Person.create(first_name: "Amanda", surname_id: @porters.id, female: true, languages_spoken: 1)
    @rusty = Person.create(first_name: "Rusty", surname_id: @porters.id, female: false, parents_id: @marlane_and_don.id, languages_spoken: 3)
    @yain = Person.create(first_name: "Yain", surname_id: @porters.id, female: true, languages_spoken: 3)

    @stacee_and_aaron = Parent.create(mother_id: @stacee.id, father_id: @aaron.id, married: true)
    @amy_and_rich = Parent.create(mother_id: @amy.id, father_id: @rich.id, married: false)
    @alissa_and_joe = Parent.create(mother_id: @alissa.id, father_id: @joe.id, married: true)
    @dana_and_travis = Parent.create(mother_id: @dana.id, father_id: @travis.id, married: true)
    @brittney_and_justin = Parent.create(mother_id: @brittney.id, father_id: @justin.id, married: true)
    @amanda_and_lee = Parent.create(mother_id: @amanda.id, father_id: @lee.id, married: true)
    @yain_and_rusty = Parent.create(mother_id: @yain.id, father_id: @rusty.id, married: true)
  end

  describe "#names" do
    it "prints the name of the mother and father" do
      expect(@marlane_and_don.names).to eq("Marlane and Don")
    end
  end
end
