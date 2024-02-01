require "rails_helper"

RSpec.describe "Relationship", type: :model do
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

    @marlane_and_don = Relationship.create(mother_id: @marlane.id, father_id: @don.id, married: true)
  end

  describe "#names" do
    it "prints the name of the mother and father" do
      expect(@marlane_and_don.names).to eq("Marlane and Don")
    end
  end
end
