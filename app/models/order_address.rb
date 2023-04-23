class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :product_id, :postcode, :area_id, :municipality, :house_number, :building_name, :telephone_number, :token

  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :area_id
    validates :municipality
    validates :house_number
    validates :telephone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order.id, postcode: postcode, area_id: area_id, municipality: municipality, house_number: house_number, building_name: building_name, telephone_number: telephone_number)
  end
end