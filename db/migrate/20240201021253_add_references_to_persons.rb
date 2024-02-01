class AddReferencesToPersons < ActiveRecord::Migration[7.1]
  def change
    add_reference :persons, :persons, null: true, foreign_key: true
    rename_column :persons, :persons_id, :parents_id
  end
end
