class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

        def self.find_omniauth(auth)
          # credential = SnsCredential.new(provider: auth.provider, uid: auth.uid)
          credential = SnsCredential.where(provider: auth.provider, uid: auth.uid).first
          if credential.present?
            user = User.where
          else
            if user.present?
            else
              # pass = Devise.friendly_token[0, 20]
              user = User.new(
                nickname: auth.info.name,
                email: auth.info.email,
                # password: pass,
                # password_confirmation: pass
              )
              credential = SnsCredential.new(provider: auth.provider, uid: auth.uid)
            end
          end
          # user.SnsCredential.build(provider: auth.provider, uid: auth.uid)
          return {user: user, sns_id: credential }
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