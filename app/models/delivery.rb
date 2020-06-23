class Delivery < ApplicationRecord
  belongs_to :customer

  def all_address
    self.postcode + self.address + self.name
  end
end
