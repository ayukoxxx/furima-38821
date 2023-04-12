class OrderAddress
  include ActiveModel::Model
  attr_accessor :postcode, :area, :municipality, :house_number, :building_name, :telephone_number, :product_id, :user_id

  with_options presence: true do
    validates :user_id
    validates :product_id
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :house_number
    validates :telephone_number
  end
  validates :area, numericality: {other_than: 0, message: "can't be blank"}
end
