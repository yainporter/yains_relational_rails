class Child < ApplicationRecord
  self.table_name = 'children'
  belongs_to :surname

  def last_name
    surname.last_name
  end
end
