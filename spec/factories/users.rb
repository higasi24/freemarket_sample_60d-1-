FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(min_length: 7)
    email {Faker::Internet.free_email}
    password {password}
    password_confirmation {password}
    birth_date {"33"}
    family_name_kana {"カナ"}
    family_name {"4"}
    first_name_kana {"カナ"}
    first_name {"4"}
    nickname {"9"}
  end
end