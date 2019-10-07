class Item < ApplicationRecord
  belongs_to :user
  belongs_to :area
  belongs_to :brand
  has_many :images
  has_many :categories, through: :categories_items
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :messages, dependent: :destroy
end
