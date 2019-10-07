class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        has_many :items, dependent: :destroy
        has_many :favorites
        has_many :orders
        has_many :reviews
        has_many :comments
        has_many :messages
        has_many :addresses, dependent: :destroy
end