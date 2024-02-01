class AddForeignKeysToChildren < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :parents, :children, column: :mother_id
    add_foreign_key :parents, :children, column: :father_id
  end
end
