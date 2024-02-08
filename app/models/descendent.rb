class Descendent < ApplicationRecord
  belongs_to :family
  belongs_to :mom, class_name: "Relationship", foreign_key: :parents_id, optional: true
  belongs_to :dad, class_name: "Relationship", foreign_key: :parents_id, optional: true
  has_many :relationships_as_mom, class_name: "Relationship", foreign_key: :mom_id, dependent: :destroy
  has_many :relationships_as_dad, class_name: "Relationship", foreign_key: :dad_id, dependent: :destroy

  validates :first_name, :family_id, :languages_spoken, presence: true
  validates :family_id, :languages_spoken, numericality: true
  validates :female, inclusion: [true, false]

  def last_name
    family.name
  end

  def siblings
  end

  def self.true_records
    Descendent.where(female: "true")
  end

  def self.family_descendents(family_id)
    Descendent.where(family_id: family_id)
  end
  def self.sort_alphabetically(family_id)
    Descendent.family_descendents(family_id).order(:first_name)
  end

  def self.threshold_filter(family_id, number)
    Descendent.family_descendents(family_id).limit(number)
  end

  def self.number_of_languages(family_id, number)
    Descendent.where("family_id = ? AND languages_spoken >= ?", family_id, number)
  end

  def self.descendents_keyword_search(keyword)
    Descendent.where(first_name: keyword)
  end

  def self.descendents_partial_match(keyword)
    Descendent.where("first_name ILIKE ?", "%#{keyword}%")
  end

  def self.create_descendent(family_id, params)
    family = Family.find(family_id)
    family.descendents.create(params)
  end
end
