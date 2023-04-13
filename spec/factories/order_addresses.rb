FactoryBot.define do
  factory :order_address do
    postcode { '123-4567' }
    area { 1 }
    municipality { '新宿区' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    telephone_number { '0123456789' }
    
  end
end