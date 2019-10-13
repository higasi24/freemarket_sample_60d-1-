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
        # validates of password
        validates_format_of :password, :with => /([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])/
        validates :password, length: {minimum: 7}
        # validates
        validates :nickname, presence: true
        validates :first_name, presence: true
        validates :family_name, presence: true
        validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
        validates :family_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
        validates :birth_date, presence: true

end