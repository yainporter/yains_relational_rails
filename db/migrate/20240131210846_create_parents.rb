class CreateParents < ActiveRecord::Migration[7.1]
  def change
    create_table :parents do |t|
      t.integer :mother_id
      t.integer :father_id
      t.boolean :married

      t.timestamps
    end
  end
end
