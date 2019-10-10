class ChangeColumnToItem < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :saler_id, :integer, null: false
  end
end
