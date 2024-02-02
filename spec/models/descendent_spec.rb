require "rails_helper"

RSpec.describe "Descendent", type: :model do
  before(:each) do
    @porters = Family.create!(name: "Porter")
    @finder = Family.create!(name: "Finders")
    @lines = Family.create!(name: "Lines")
    @burnett = Family.create!(name: "Burnett")
    @pini = Family.create!(name: "Pini")
    @jones = Family.create!(name: "Jones")
    @saechao = Family.create!(name: "Saechao")

    @marlane = Descendent.create(first_name: "Marlane", family_id: @porters.id, female: true, languages_spoken: 1)
    @don = Descendent.create(first_name: "Don", family_id: @porters.id, female: false, languages_spoken: 2)

    @hana = Descendent.create(first_name: "Hana", family_id: @finder.id, female: true, languages_spoken: 1)
    @ethan = Descendent.create(first_name: "Ethan", family_id: @finder.id, female: false, languages_spoken: 1)
    @oran = Descendent.create(first_name: "Oran", family_id: @finder.id, female: false, languages_spoken: 1)
    @kael = Descendent.create(first_name: "Kael", family_id: @finder.id, female: false, languages_spoken: 1)
  end

  describe "class methods" do
    describe ".true_records" do
      it "returns all descendents that are female" do
        expect(Descendent.true_records).to eq([@marlane, @hana])
      end
    end

    describe ".family_descendents" do
      it "returns all descendents associated with a given Family" do
        expect(Descendent.family_descendents(@finder.id)).to eq([@hana, @ethan, @oran, @kael])
      end
    end

    describe ".sort_alphabetically" do
      it "sorts a family's descendents alphabetically" do
        expect(Descendent.sort_alphabetically(@finder.id)).to eq([@ethan, @hana, @kael, @oran])
      end
    end
  end

  describe "instance methods" do
    describe "#last_name" do
      it "prints the last name of the Descendent" do
        expect(@marlane.last_name).to eq("Porter")
      end
    end
  end
end
