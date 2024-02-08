class Relationship < ApplicationRecord
  belongs_to :mom, class_name: 'Descendent', foreign_key: :mom_id
  belongs_to :dad, class_name: 'Descendent', foreign_key: :dad_id
  has_many :children, class_name: 'Descendent', foreign_key: :parents_id, dependent: :destroy

  validates :mom_id, presence: true
  validates :dad_id, presence: true
  validates :married, inclusion: [true, false]
end
