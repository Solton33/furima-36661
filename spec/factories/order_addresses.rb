FactoryBot.define do
  factory :order_address do
    postal_code          { '123-4567' }
    prefectures_id        {Faker::Number.between(from: 2, to: 48)}
    municipality         { 'テスト区' }
    address              { '1-1' }
    building             { '東京ハイツ' }
    phone_number         { 12312341234 }
    token                {"tok_abcdefghijk00000000000000000"}
    
  end
end
