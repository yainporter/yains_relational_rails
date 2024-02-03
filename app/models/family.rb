class Family < ApplicationRecord
  has_many :descendents, dependent: :destroy
  has_many :relationships, through: :descendents

  def self.sort_by_creation
    Family.all.order(created_at: :desc)
  end

  def self.sort_by_number_of_descendents
    Family.select('families.*, count(descendents.id) as descendents_count').left_outer_joins(:descendents).group('families.id').order('descendents_count desc').includes(:descendents)
  end

  def count_descendents
    descendents.count
  end
end
