FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    price { Faker::Number.between(from: 300, to: 9999999) }
    shipping_cost { ShippingCost.all.sample }
    condition { Condition.all.sample }
    area { Area.all.sample }
    ship_date { ShipDate.all.sample }
    introduction { Faker::Lorem.sentence }
    category { Category.all.sample }

    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

