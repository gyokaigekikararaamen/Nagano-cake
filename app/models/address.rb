class Address < ApplicationRecord
  belongs_to :customer

  def combine_address
  	"〒" + self.postal_code + "　" + self.address + "　" + self.name
  end
  
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  
end