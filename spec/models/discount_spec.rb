require 'rails_helper'

RSpec.describe Discount, type: :model do
  context "attributes" do
    it { is_expected.to respond_to :account }
    it { is_expected.to respond_to :description }
    it { is_expected.to respond_to :amount }
    it { is_expected.to respond_to :sale_id }
  end

  context "associations" do
    it { should belong_to(:sale) }
  end
end
