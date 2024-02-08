require "rails_helper"

RSpec.describe Relationship, type: :model do
  describe "associations" do
    it { should belong_to(:mom)}
    it { should belong_to(:dad)}
    it { should have_many(:children)}
    # it { should belong_to(:family).through(:relationship_as_dad)}
    # How do I write this association?

  end

  describe "validations" do
    it { should validate_presence_of(:mom_id) }
    it { should validate_presence_of(:dad_id) }
    # How do I validate the presence of :married?
  end
end
