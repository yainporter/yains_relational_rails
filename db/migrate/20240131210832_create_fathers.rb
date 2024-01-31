class CreateFathers < ActiveRecord::Migration[7.1]
  def change
    create_table :fathers do |t|
      t.references :persons, null: false, foreign_key: true

      t.timestamps
    end
  end
end
