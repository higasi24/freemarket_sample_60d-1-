class RemoveBrandIdFromItems < ActiveRecord::Migration[5.2]
  def up
    remove_column :items, :brand_id
  end
end
