require 'rails_helper'

RSpec.describe "ProfitAndLoss API" do
  context "GET /api/v1/profit_and_loss" do
    it "returns the profit and loss statement for all customers and all products (no filters)" do
      client  = create(:client)
      binding.pry
    end
  end
end