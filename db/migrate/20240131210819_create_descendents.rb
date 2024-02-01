class CreateDescendents < ActiveRecord::Migration[7.1]
  def change
    create_table :descendents do |t|
      t.string :first_name
      t.references :family, null: false, foreign_key: true
      t.references :descendents, null: true, foreign_key: true
      t.boolean :female
      t.integer :languages_spoken, default: 1

      t.timestamps
    end
  end
end
