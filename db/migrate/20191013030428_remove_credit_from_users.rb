class RemoveCreditFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :credit, :integer
  end
end
