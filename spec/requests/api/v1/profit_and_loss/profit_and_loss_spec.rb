require 'rails_helper'

RSpec.describe "ProfitAndLoss API" do
  context "GET /api/v1/profit_and_loss" do
    it "returns the profit and loss statement for all customers and all products (no filters)" do
      sales = create(:sale)
      discounts = create(:discount, sale_id: sales.id)
      cogs = create(:cost_of_goods_sold, sale_id: sales.id)
      op_expenses = create(:operating_expense, sale_id: sales.id)

      get "/api/v1/profit_and_loss"

      expect(response).to be_success

      raw_data = JSON.parse(response.body)
      first_month_data = raw_data[0]

      expect(first_month_data).to have_key("date")
      expect(first_month_data).to have_key("sales")
      expect(first_month_data).to have_key("discount")
      expect(first_month_data).to have_key("net_sales")
      expect(first_month_data).to have_key("cogs")
      expect(first_month_data).to have_key("gross_profit")
      expect(first_month_data).to have_key("op_expense")
      expect(first_month_data).to have_key("net_profit")
      expect(first_month_data["sales"].to_f).to eq(1234.56)
      expect(first_month_data["discount"].to_f).to eq(100.67)
      expect(first_month_data["op_expense"].to_f).to eq(80.56)
      expect(first_month_data["cogs"].to_f).to eq(234.56)
      expect(first_month_data["net_sales"].to_f).to eq(1335.23)
      expect(first_month_data["gross_profit"].to_f).to eq(1569.79)
      expect(first_month_data["net_profit"].to_f).to eq(1650.35)
    end
  end
end