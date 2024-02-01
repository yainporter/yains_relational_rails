class Person < ApplicationRecord
  self.table_name = 'persons'
  belongs_to :surname

  def last_name
    surname.last_name
  end
end
