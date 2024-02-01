require "rails_helper"

RSpec.describe "Parent", type: :model do
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
  end

  describe "#names" do
    it "prints the name of the mother and father" do
      expect(@marlane_and_don.names).to eq("Marlane and Don")
    end
  end
end
