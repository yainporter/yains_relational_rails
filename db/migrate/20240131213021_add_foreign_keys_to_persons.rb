class AddForeignKeysToPersons < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :persons, :surnames, column: :maiden_name_id
  end
end
