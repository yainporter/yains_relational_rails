class Family < ApplicationRecord
  has_many :descendents, dependent: :destroy
  has_many :relationships, through: :descendents

  def self.sort_by_creation
    Family.order(created_at: :desc)
  end

  def self.sort_by_number_of_descendents
    Family.select('families.*, count(descendents.id) as descendents_count')
          .left_outer_joins(:descendents)
          .group('families.id')
          .order('descendents_count desc')
          .includes(:descendents)
  end

  def self.keyword_search(keyword)
    Family.where(name: keyword)
  end

  def self.partial_match(keyword)
    Family.where("name ILIKE ?", "%#{keyword}%")
  end

  def count_descendents
    descendents.size
  end
end
