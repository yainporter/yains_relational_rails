class CreateRelationships < ActiveRecord::Migration[7.1]
  def change
    create_table :relationships do |t|
      t.string :relationship_type
      t.integer :porter_descendent_id
      t.integer :porter_relationship_id
      t.boolean :children

      t.timestamps
    end
  end
end
