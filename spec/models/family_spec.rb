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
end
