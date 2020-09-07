FactoryBot.define do
  factory :user do
    name                  {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password              {password}
    password_confirmation {password}
    family_name           {"阿部"}
    first_name            {"太郎"}
    family_name_kana      {"カタカナ"}
    first_name_kana       {"カタカナ"}
    birthday = Faker::Date.birthday
    birthday              {birthday}
  end
end


