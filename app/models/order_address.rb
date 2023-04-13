class OrderAddress
  include ActiveModel::Model
  attr_accessor :postcode, :area, :municipality, :house_number, :building_name, :telephone_number, :product_id, :user_id

  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
    validates :house_number
    validates :telephone_number,  format: {with: /\A0\d{9,}\z/, message: "is too short"}
    validates :telephone_number,  format: {with: /\A0\d{9,10}\z/, message: "is invalid. Input only number"}
  end
  validates :area, numericality: {other_than: 0, message: "can't be blank"}

  def save
    order = Order.create(product_id: product_id, user_id: user_id)
    Address.create(postcode: postcode, area: area, municipality: municipality, house_number: house_number, building_name: building_name, telephone_number: telephone_number, order_id: order.id)
  end
end
