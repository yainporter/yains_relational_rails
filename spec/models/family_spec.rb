require "rails_helper"

RSpec.describe "Family", type: :model do
  before(:each) do
    @porter = Family.create!(name: "Porter")
    @finder = Family.create!(name: "Finders")
    @lines = Family.create!(name: "Lines")
    @burnett = Family.create!(name: "Burnett")
    @pini = Family.create!(name: "Pini")
    @jones = Family.create!(name: "Jones")
    @saechao = Family.create!(name: "Saechao")

    @marlane = Descendent.create(first_name: "Marlane", family_id: @jones.id, female: true, languages_spoken: 1)
    @don = Descendent.create(first_name: "Don", family_id: @jones.id, female: false, languages_spoken: 2)
    @aaron = Descendent.create(first_name: "Aaron", family_id: @burnett.id, female: false, languages_spoken: 1)
    @stacee = Descendent.create(first_name: "Stacee", family_id: @finder.id, female: true, languages_spoken: 1)
    @amy = Descendent.create(first_name: "Amy", family_id: @finder.id, female: true, languages_spoken: 1)
    @rich = Descendent.create(first_name: "Rich", family_id: @finder.id, female: false, languages_spoken: 1)
    @alissa = Descendent.create(first_name: "Alissa", family_id: @lines.id, female: true, languages_spoken: 1)
    @joe = Descendent.create(first_name: "Joe", family_id: @porter.id, female: false, languages_spoken: 1)
    @cami = Descendent.create(first_name: "Cami", family_id: @lines.id, female: true)
    @justin = Descendent.create(first_name: "Justin", family_id: @pini.id, female: false, languages_spoken: 1)
    @brittney = Descendent.create(first_name: "Brittney", family_id: @pini.id, female: true, languages_spoken: 1)
    @lee = Descendent.create(first_name: "Lee", family_id: @porter.id, female: false, languages_spoken: 2)
    @amanda = Descendent.create(first_name: "Amanda", family_id: @burnett.id, female: true, languages_spoken: 1)
    @rusty = Descendent.create(first_name: "Rusty", family_id: @burnett.id, female: false, languages_spoken: 3)
    @yain = Descendent.create(first_name: "Yain", family_id: @burnett.id, female: true, languages_spoken: 3)
    @allen = Descendent.create(first_name: "Allen", family_id: @lines.id, female: false)
    @caroyln = Descendent.create(first_name: "Carolyn", family_id: @lines.id, female: true)
    @robert = Descendent.create(first_name: "Robert", family_id: @lines.id, female: false)
    @halee = Descendent.create(first_name: "Halee", family_id: @porter.id, female: true)
    @brett = Descendent.create(first_name: "Brett", family_id: @porter.id, female: false)
    @logan = Descendent.create(first_name: "Logan", family_id: @porter.id, female: false)
    @hana = Descendent.create(first_name: "Hana", family_id: @finder.id, female: true)
    @ethan = Descendent.create(first_name: "Ethan", family_id: @finder.id, female: false)
    @oran = Descendent.create(first_name: "Oran", family_id: @finder.id, female: false)
    @millie = Descendent.create(first_name: "Millie", family_id: @pini.id, female: true)
  end

  describe "class methods" do
    describe ".sort_by_creation" do
      it "sorts families by creation date" do
        expect(Family.sort_by_creation).to eq [@saechao, @jones, @pini, @burnett, @lines, @finder, @porter]

        @schnepf = Family.create!(name: "Schnepf", created_at: 1.day.ago)
        @new_family = Family.create!(name: "New Family")

        expect(Family.sort_by_creation).to eq [ @new_family, @saechao, @jones, @pini, @burnett, @lines, @finder, @porter, @schnepf]
      end
    end

    describe ".sort_by_number_of_descendents" do
      it "sorts families by the number of descendents" do
        expect(Family.sort_by_number_of_descendents).to eq([@finder, @porter, @lines, @burnett, @pini, @jones, @saechao])
      end
    end
  end

  describe "instance methods" do
    describe "#count_descendents" do
      it "returns the number of descendents" do
        expect(@porter.count_descendents).to eq(5)
        expect(@finder.count_descendents).to eq(6)
      end
    end
  end
end
