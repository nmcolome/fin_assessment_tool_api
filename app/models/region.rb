class Region < ApplicationRecord
  has_many :clients, dependent: :destroy
  has_many :region_products, dependent: :destroy
  has_many :products, through: :region_products
end
