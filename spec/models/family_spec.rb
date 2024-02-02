require "rails_helper"

RSpec.describe "Family", type: :model do
  before(:each) do
    @porters = Family.create!(name: "Porter")
    @finders = Family.create!(name: "Finders")
    @lines = Family.create!(name: "Lines")
    @burnett = Family.create!(name: "Burnett")
    @pini = Family.create!(name: "Pini")
    @jones = Family.create!(name: "Jones")
    @saechao = Family.create!(name: "Saechao")

    @marlane = Descendent.create(first_name: "Marlane", family_id: @porters.id, female: true, languages_spoken: 1)
    @don = Descendent.create(first_name: "Don", family_id: @porters.id, female: false, languages_spoken: 2)
  end

  describe "class methods" do
    describe ".sort_by_creation" do
      it "sorts families by creation date" do
        expect(Family.sort_by_creation).to eq [@saechao, @jones, @pini, @burnett, @lines, @finders, @porters]

        @schnepf = Family.create!(name: "Schnepf", created_at: 1.day.ago)
        @new_family = Family.create!(name: "New Family")

        expect(Family.sort_by_creation).to eq [ @new_family, @saechao, @jones, @pini, @burnett, @lines, @finders, @porters, @schnepf]
      end
    end
  end
end
