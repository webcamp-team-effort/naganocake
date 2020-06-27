class Delivery < ApplicationRecord
  belongs_to :customer

  validates :customer_id, presence: true
  validates :postcode, presence: true, length: {is: 7}
  validates :address, presence: true
  validates :name, presence: true

  def all_address
    self.postcode + self.address + self.name
  end
end
