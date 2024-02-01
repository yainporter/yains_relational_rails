class AddForeignKeysToPersons < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :persons, :surnames, column: :maiden_name_id
    add_foreign_key :parents, :persons, column: :mother_id
    add_foreign_key :parents, :persons, column: :father_id
  end
end
