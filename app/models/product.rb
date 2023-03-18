class Product < ApplicationRecord

validates :image, presence: true
validates :name, presence: true
validates :price, presence: true,  numericality: { greater_than_or_equal_to: 300, message: "は300円以上で設定してください（半角数字）" }
validates :price,  format: { with: /\d{,7}/, message: 'は1,000万円未満で入力してください（半角数字）' }
validates :shipping_cost_id,  numericality: { other_than: 1 , message: "can't be blank"} 
validates :condition_id,  numericality: { other_than: 1, message: "can't be blank" } 
validates :area_id,  numericality: { other_than: 1 , message: "can't be blank"} 
validates :ship_date_id, numericality: { other_than: 1, message: "can't be blank" } 
validates :introduction, presence: true
validates :category_id, numericality: { other_than: 1 , message: "can't be blank"} 


belongs_to :user
has_one_attached :image

extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_cost
  belongs_to :area
  belongs_to :ship_date
  belongs_to :category
  belongs_to :condition


end
