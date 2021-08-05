FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    telephone_number { '09012345678' }
  end
end
