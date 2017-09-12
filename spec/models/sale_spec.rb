require 'rails_helper'

RSpec.describe Sale, type: :model do
  describe "attributes" do
    it { is_expected.to respond_to :amount }
    it { is_expected.to respond_to :client_id }
    it { is_expected.to respond_to :region_product_id }
  end

  describe "associations" do
    it { should belong_to(:client) }
    it { should belong_to(:region_product) }
    it { should have_many(:discounts)}
    it { should have_many(:cost_of_goods_solds)}
    it { should have_many(:operating_expenses)}
  end
end
