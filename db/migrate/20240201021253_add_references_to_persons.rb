class AddReferencesToPersons < ActiveRecord::Migration[7.1]
  def change
    add_reference :persons, :parents, null: true, foreign_key: true
  end
end
