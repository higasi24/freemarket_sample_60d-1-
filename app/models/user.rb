class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

        def self.from_omniauth(auth)
          credential = SnsCredential.where(provider: auth.provider, uid: auth.uid).first
          if credential
            user = User.find(credential.user_id)
          else
            user = User.where(email: auth.info.email).first_or_create do |u|
              u.password = Devise.friendly_token[0,20]
            end
            SnsCredential.create(provider: auth.provider, uid: auth.uid, user_id: user.id)
            user
          end
        end
        
        has_many :items, dependent: :destroy
        has_many :favorites, dependent: :destroy
        has_many :favorite_items, through: :favorites, source: :item

        has_many :orders
        has_many :reviews
        has_many :comments
        has_many :messages
        has_many :addresses, dependent: :destroy
        has_one  :card
        has_many :sns_credentials, dependent: :destroy
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