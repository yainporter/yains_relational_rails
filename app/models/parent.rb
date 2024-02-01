class Parent < ApplicationRecord
  has_many :persons

  def names
    mothers_name << " and " << fathers_name
  end

  private

  def mothers_name
    Person.find_by(id: self.mother_id).first_name
  end

  def fathers_name
    Person.find_by(id: self.father_id).first_name
  end
end
