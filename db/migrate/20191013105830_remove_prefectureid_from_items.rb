class RemovePrefectureidFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :prefecture_id, :integer
  end
end
