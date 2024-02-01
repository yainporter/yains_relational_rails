class AddReferencesToChildren < ActiveRecord::Migration[7.1]
  def change
    add_reference :children, :parents, null: true, foreign_key: true
  end
end
