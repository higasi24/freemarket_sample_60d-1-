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

      t.timestamps
    end
  end
end
