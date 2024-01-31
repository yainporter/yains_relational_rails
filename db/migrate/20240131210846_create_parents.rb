class CreateParents < ActiveRecord::Migration[7.1]
  def change
    create_table :parents do |t|
      t.references :mothers, null: false, foreign_key: true
      t.references :fathers, null: false, foreign_key: true
      t.boolean :married

      t.timestamps
    end
  end
end
