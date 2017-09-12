require 'rails_helper'

RSpec.describe Sale, type: :model do
  describe "attributes" do
    it { is_expected.to respond_to :sales }
    it { is_expected.to respond_to :client_id }
    it { is_expected.to respond_to :region_product_id }
  end

  describe "associations" do
    it { should belong_to(:client) }
    it { should belong_to(:region_product) }
  end
end
