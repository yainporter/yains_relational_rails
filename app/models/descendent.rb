class Descendent < ApplicationRecord
  belongs_to :family

  def last_name
    family.name
  end

  def self.true_records
    Descendent.where(female: "true")
  end
end
