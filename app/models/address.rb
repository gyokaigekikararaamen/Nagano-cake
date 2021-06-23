class Address < ApplicationRecord
  belongs_to :customer
  def set_adress
    self.postal_code+" "+self.address+" "+self.name
  end
end
