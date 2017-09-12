require 'rails_helper'

RSpec.describe RegionProduct, type: :model do
  describe "attributes" do
    it { is_expected.to respond_to :region_id }
    it { is_expected.to respond_to :product_id }
  end

  describe "relationships" do
    it { should belong_to(:region) }
    it { should belong_to(:product) }
  end
end
