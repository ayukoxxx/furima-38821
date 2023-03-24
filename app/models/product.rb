class Product < ApplicationRecord

  validates :image, presence: true
  validates :name, presence: true
  validates :price, numericality: {only_integer: true, message: 'Half-width number'}
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
  validates :introduction, presence: true
  validates :price, presence: true
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