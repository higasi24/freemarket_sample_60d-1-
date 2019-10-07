class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string   :brand,        null: false, unique: true
      t.integer  :parent_id

      t.timestamps
    end
  end
end
