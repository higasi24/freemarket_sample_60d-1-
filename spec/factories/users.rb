FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(min_length: 7)
    email {Faker::Internet.free_email}
    password {password}
    password_confirmation {password}
    nickname {"あああ"}
    first_name {"あああ"}
    family_name {"あああ"}
    first_name_kana {"ア"}
    family_name_kana {"ア"}
    birth_date {"{1=>1035, 2=>6, 3=>3}"}
  end
end