class Descendent < ApplicationRecord
  belongs_to :family

  def last_name
    family.last_name
  end
end
