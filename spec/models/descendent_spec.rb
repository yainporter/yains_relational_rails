require "rails_helper"

RSpec.describe Descendent, type: :model do
  describe "associations" do
    it { should belong_to(:family)}
    it { should have_one(:relationship_as_dad) }
    it { should have_one(:relationship_as_mom) }
  end

  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:family_id) }
    it { should validate_presence_of(:languages_spoken) }
    # How do I validate the presence of :female?
  end

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

    describe ".threshold_filter" do
      it "limits the number of descendents returned" do
        expect(Descendent.threshold_filter(@finder.id, 3)).to eq([@hana, @ethan, @oran])
      end
    end

    describe ".descendents_keyword_search" do
      it "returns an exact match of the keyword" do
        expect(Descendent.descendents_keyword_search(@marlane.first_name)).to eq([@marlane])
      end
    end

    describe ".partial_match" do
      it "returns a partial match of the keyword" do
        mary = Descendent.create!(first_name: "Mary", family_id: @porters.id, female: true, languages_spoken: 1)

        expect(Descendent.descendents_partial_match("Ma")).to eq([@marlane, mary])
      end
    end

    describe ".number_of_languages" do
      it "returns Descendents who speak a certain number of languages" do
        rusty = Descendent.create!(first_name: "Rusty", family_id: @porters.id, female: false, languages_spoken: 3)

        expect(Descendent.number_of_languages(@porters.id, 2)).to eq([@don, rusty])
      end
    end

    describe ".create_descendent" do
      it "creates a Descendent from a Family" do
        params = Hash.new(first_name: "John", female: false, languages_spoken: 5)
        john = Descendent.create_descendent(@pini.id, params)

        expect(john).to be_a Descendent
        expect(john.family_id).to eq(@pini.id)
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
