class AddForeignKeysToRelationships < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :relationships, :descendents, column: :porter_descendent_id
    add_foreign_key :relationships, :descendents, column: :porter_relationship_id
  end
end
