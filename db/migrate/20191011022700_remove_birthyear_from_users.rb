class RemoveBirthyearFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :birth_year, :integer
  end
end