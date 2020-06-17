class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  attachment :image
end
