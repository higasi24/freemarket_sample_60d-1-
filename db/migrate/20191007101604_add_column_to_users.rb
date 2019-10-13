class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string, null: false    ###ニックネーム
    add_column :users, :first_name, :string, null: false　　###太郎
    add_column :users, :family_name, :string, null: false   ###山田
    add_column :users, :first_name_kana, :string, null: false ###タロウ
    add_column :users, :family_name_kana, :string, null: false  ###ヤマダ
    add_column :users, :birth_year, :integer, null: false ###誕生日　年
    add_column :users, :birth_month, :integer, null: false  ###誕生日　月
    add_column :users, :birth_day, :integer, null: false  ###誕生日　日
    add_column :users, :tel, :integer, null: false, unique: true  ###携帯電話番号
    add_column :users, :credit, :string, unique: true ###クレジットカード
  end
end
