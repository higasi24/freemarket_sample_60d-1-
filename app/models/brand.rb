class Brand < ApplicationRecord
  has_many :items
  belongs_to :parent, class_name: :Brand
  has_many :children, class_name: :Brand, foreign_key: :parent_id
end
