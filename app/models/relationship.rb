class Relationship < ApplicationRecord
  belongs_to :mom, class_name: 'Descendent', foreign_key: 'mom_id', dependent: :destroy
  belongs_to :dad, class_name: 'Descendent', foreign_key: 'dad_id', dependent: :destroy
  belongs_to :family

  validates :mom_id, presence: true
  validates :dad_id, presence: true
  validates :married, inclusion: [true, false]
end
