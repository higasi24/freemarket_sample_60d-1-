class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :message, null: false
      t.string      :name,            null: false
      t.text        :detail
      t.string      :state,           null: false
      t.string      :delivery_fee,    null: false
      t.integer     :price,           null: false
      t.string      :delivery_method, null: false
      t.string      :delivery_date,   null: false
      t.references  :item,            null: false, foreign_key: true
      t.references  :user,            null: false, foreign_key: true


      t.timestamps
    end
  end
end
