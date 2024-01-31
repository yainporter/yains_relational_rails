class CreateMothers < ActiveRecord::Migration[7.1]
  def change
    create_table :mothers do |t|
      t.references :persons, null: false, foreign_key: true

      t.timestamps
    end
  end
end
