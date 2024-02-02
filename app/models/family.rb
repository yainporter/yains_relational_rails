class Family < ApplicationRecord
  has_many :descendents, dependent: :destroy
  has_many :relationships, through: :descendents

  def self.sort_by_creation
    Family.all.order(created_at: :desc)
  end
end
