class Descendent < ApplicationRecord
  belongs_to :family

  def last_name
    family.name
  end
end
