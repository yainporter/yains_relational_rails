class CreateSurnames < ActiveRecord::Migration[7.1]
  def change
    create_table :surnames do |t|
      t.string :last_name

      t.timestamps
    end
  end
end
