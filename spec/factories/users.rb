FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 6,min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    last_name             { '佐々木' }
    first_name            { 'メアリー' }
    last_name_kana        { 'ササキ' }
    first_name_kana       { 'メアリー' }
    birth                 { '111111' }
  end
end
