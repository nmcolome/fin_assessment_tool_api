class Sale < ApplicationRecord
  belongs_to :client
  belongs_to :region_product
  has_many :discounts, dependent: :destroy
  has_many :cost_of_goods_solds, dependent: :destroy
  has_many :operating_expenses, dependent: :destroy
end
