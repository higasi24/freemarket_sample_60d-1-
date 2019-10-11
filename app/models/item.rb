class Item < ApplicationRecord
  # belongs_to :user
  # belongs_to :brand, optional: true
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :category_items, dependent: :destroy
  has_many :categories, through: :category_items
  accepts_nested_attributes_for :category_items, allow_destroy: true
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :messages, dependent: :destroy
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
