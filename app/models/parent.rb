class Parent < ApplicationRecord
  has_many :children

  def names
    mothers_name << " and " << fathers_name
  end

  private

  def mothers_name
    Child.find_by(id: self.mother_id).first_name
  end

  def fathers_name
    Child.find_by(id: self.father_id).first_name
  end
end
