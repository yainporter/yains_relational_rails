require "rails_helper"

RSpec.describe "Person", type: :model do
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
  end

  describe "#last_name" do
    it "prints the last name of the person" do
      expect(@marlane.last_name).to eq("Porter")
    end
  end
end
