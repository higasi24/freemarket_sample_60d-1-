class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer     :buyer_id,        null: false, foreign_key: true
      t.integer     :saler_id,        null: false, foreign_key: true
      t.references  :item,            null: false, foreign_key: true
      

      t.timestamps
    end
  end
end
