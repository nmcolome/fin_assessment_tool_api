class RegionProduct < ApplicationRecord
  belongs_to :region
  belongs_to :product
  has_many :sales
end
