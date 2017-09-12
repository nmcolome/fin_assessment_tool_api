class Sale < ApplicationRecord
  belongs_to :client
  belongs_to :region_product
  has_many :discounts
  has_many :cost_of_goods_solds
  has_many :operating_expenses
end
