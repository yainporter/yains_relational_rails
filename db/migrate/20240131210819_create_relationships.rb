class CreateRelationships < ActiveRecord::Migration[7.1]
  def change
    create_table :relationships do |t|
      t.integer :mom_id
      t.integer :dad_id
      t.boolean :married, default: true, null: false

      t.timestamps
    end
  end
end
