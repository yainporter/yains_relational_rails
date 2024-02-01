class CreatePersons < ActiveRecord::Migration[7.1]
  def change
    create_table :persons do |t|
      t.string :first_name
      t.references :surname, null: false, foreign_key: true
      t.boolean :female
      t.integer :languages_spoken, default: 1

      t.timestamps
    end
  end
end
