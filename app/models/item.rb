class Item < ApplicationRecord
  belongs_to :user
  belongs_to :brand
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"
  has_many :images
  has_many :categories, through: :categories_items
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy
  has_many :messages, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
