class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string        :prefecture,         null: false
      t.string        :city,               null: false
      t.string        :block,              null: false
      t.string        :building
      t.references    :user,               null: false, foreign_key: true

      
      t.timestamps
    end
  end
end