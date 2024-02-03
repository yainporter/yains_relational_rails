class Family < ApplicationRecord
  has_many :descendents, dependent: :destroy
  has_many :relationships, through: :descendents

  def self.sort_by_creation
    Family.all.order(created_at: :desc)
  end

  def self.sort_by_number_of_descendents
    require 'pry'; binding.pry
    Family.select('families.*, count(descendents.id) as descendents_count').joins(:descendents).group('families.id').order('descendents_count desc')
    ### Does not return families where family.count_descendents = 0
  end

  def count_descendents
    descendents.count
  end
end
