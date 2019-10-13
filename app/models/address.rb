class Address < ApplicationRecord
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  validates :prefecture_id, presence: true
  validates :city, presence: true
  validates :block, presence: true
end
