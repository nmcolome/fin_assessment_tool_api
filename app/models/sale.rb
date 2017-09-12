class Sale < ApplicationRecord
  belongs_to :client
  belongs_to :region_product
  has_many :discounts
end
