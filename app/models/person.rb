class Person < ApplicationRecord
  self.table_name = 'persons'
  belongs_to :surname
end
