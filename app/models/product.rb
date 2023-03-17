class Product < ApplicationRecord

validates :image, presence: true
validates :name, presence: true
validates :price, presence: true
validates :shipping_cost_id, presence: true
validates :condition_id, presence: true
validates :area_id, presence: true
validates :ship_date_id, presence: true
validates :introduction, presence: true
validates :category_id, presence: true


belongs_to :user
has_one_attached :image
end
