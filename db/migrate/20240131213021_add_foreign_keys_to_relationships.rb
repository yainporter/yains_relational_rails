class AddForeignKeysToRelationships < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :relationships, :descendents, column: :mom_id
    add_foreign_key :relationships, :descendents, column: :dad_id
    rename_column :descendents, :descendents_id, :parents_id
  end
end
