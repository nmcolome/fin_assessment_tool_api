require 'rails_helper'

RSpec.describe CostOfGoodsSold, type: :model do
  context "attributes" do
    it { is_expected.to respond_to(:sale_id)}
    it { is_expected.to respond_to(:account)}
    it { is_expected.to respond_to(:description)}
    it { is_expected.to respond_to(:amount)}
  end

  context "associations" do
    it { should belong_to(:sale)}
  end
end
