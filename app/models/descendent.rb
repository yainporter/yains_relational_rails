class Descendent < ApplicationRecord
  belongs_to :family
  has_one :relationship_as_mom, class_name: "Relationship", foreign_key: "mom_id", dependent: :destroy
  has_one :relationship_as_dad, class_name: "Relationship", foreign_key: "dad_id", dependent: :destroy

  def last_name
    family.name
  end

  def self.true_records
    Descendent.where(female: "true")
  end

  def self.family_descendents(family_id)
    Descendent.where("family_id = ?", family_id)
  end
  def self.sort_alphabetically(family_id)
    Descendent.family_descendents(family_id).order(:first_name)
  end
end
