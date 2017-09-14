class Product < ApplicationRecord
  belongs_to :category
  has_many :region_products, dependent: :destroy
  has_many :regions, through: :region_products
end
