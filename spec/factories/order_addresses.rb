FactoryBot.define do
  factory :order_address do
    postcode { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    area_id { Faker::Number.between(from: 1, to: 47) }
    municipality { Faker::Address.city }
    house_number { Faker::Address.street_address }
    building_name { Faker::Address.street_address }
    telephone_number { Faker::Number.decimal_part(digits: 11) }
    token { Faker::Internet.password(min_length: 20, max_length: 30) }
    
  end
end