class Product < ApplicationRecord
  has_many :order_products, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  belongs_to :genre

  validates :genre_id, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :tax_included_price, presence: true
  validates :image_id, presence: true

  attachment :image
end
