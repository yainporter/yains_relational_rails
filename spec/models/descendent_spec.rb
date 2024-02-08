require "rails_helper"

RSpec.describe Descendent, type: :model do
  describe "associations" do
    it { should have_many(:relationships_as_mom)}
    it { should have_many(:relationships_as_dad)}
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
    @marlane_and_don = Relationship.create(mom_id: @marlane.id, dad_id: @don.id)
    @amy = Descendent.create(first_name: "Amy", family_id: @finder.id, female: true, languages_spoken: 1, parents_id: @marlane_and_don.id)
    @rich = Descendent.create(first_name: "Rich", family_id: @finder.id, female: false, languages_spoken: 1)

    @amy_and_rich = Relationship.create(mom_id: @amy.id, dad_id: @rich.id, married: false)


    @hana = Descendent.create(first_name: "Hana", family_id: @finder.id, female: true, languages_spoken: 1, parents_id: @amy_and_rich.id)
    @ethan = Descendent.create(first_name: "Ethan", family_id: @finder.id, female: false, languages_spoken: 1, parents_id: @amy_and_rich.id)
    @oran = Descendent.create(first_name: "Oran", family_id: @finder.id, female: false, languages_spoken: 1, parents_id: @amy_and_rich.id)
    @kael = Descendent.create(first_name: "Kael", family_id: @finder.id, female: false, languages_spoken: 1, parents_id: @amy_and_rich.id)
  end

  describe "class methods" do
    describe ".true_records" do
      it "returns all descendents that are female" do
        expect(Descendent.true_records).to eq([@marlane, @amy, @hana])
      end
    end

    describe ".family_descendents" do
      it "returns all descendents associated with a given Family" do
        expect(Descendent.family_descendents(@finder.id)).to eq([@amy, @rich,@hana, @ethan, @oran, @kael])
      end
    end

    describe ".sort_alphabetically" do
      it "sorts a family's descendents alphabetically" do
        expect(Descendent.sort_alphabetically(@finder.id)).to eq([@amy,@ethan, @hana, @kael, @oran, @rich])
      end
    end

    describe ".threshold_filter" do
      it "limits the number of descendents returned" do
        expect(Descendent.threshold_filter(@finder.id, 3)).to eq([@amy, @rich, @hana])
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

    describe "#siblings" do
      it "returns the siblings of the Descendent" do
        expect(@hana.siblings).to eq([@ethan, @oran, @kael])
      end
    end
  end
end
