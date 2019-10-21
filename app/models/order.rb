class Order < ApplicationRecord
  belongs_to :saler, class_name: "User"
end
