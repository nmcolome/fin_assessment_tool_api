class Region < ApplicationRecord
  has_many :clients
  has_many :region_products
  has_many :products, through: :region_products
end
