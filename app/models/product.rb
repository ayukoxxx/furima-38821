class Product < ApplicationRecord

validates :image, presence: true
validates :name, presence: true
validates :price, presence: true,  numericality: { greater_than_or_equal_to: 300, message: "は300円以上で設定してください（半角数字）" }
validates :price, length: { maximum: 7, message: 'は1,000万円未満で入力してください（半角数字）' }
validates :introduction, presence: true
validates :category, presence: true
validates :condition, presence: true
validates :shipping_cost, presence: true
validates :area, presence: true
validates :ship_date, presence: true



belongs_to :user
has_one_attached :image

extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shipping_cost
  belongs_to :area
  belongs_to :ship_date
  belongs_to :category
  belongs_to :condition


end
