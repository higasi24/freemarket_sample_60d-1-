class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string      :name,              null: false
      t.text        :detail
      t.string      :state,             null: false
      t.string      :delivery_fee,      null: false
      t.integer     :price,             null: false
      t.string      :delivery_method,   null: false
      t.string      :delivery_date,     null: false
      t.integer     :buyer_id,          foreign_key: true
      t.integer     :saler_id,          null: false, foreign_key: true
      t.references   :brand,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
