require 'rails_helper'

RSpec.describe 'Dashboard API' do
  context 'GET /api/v1/dashboard' do
    it 'returns YTD net_sales and discounts for current and previous year' do
      region = create(:region)
      region_product = create(:region_product, region_id: region.id)
      client = create(:client, region_id: region.id)
      sales = create(:sale, client_id: client.id, region_product_id: region_product.id)
      sales2 = create(:sale, transaction_date: "2017/01/14", amount: 2435.87, client_id: client.id, region_product_id: region_product.id)
      discounts = create(:discount, sale_id: sales.id)
      discounts2 = create(:discount, sale_id: sales2.id)
      prev_sales = create(:sale, transaction_date: "2016/09/14", amount: 1014.87, client_id: client.id, region_product_id: region_product.id)
      prev_sales2 = create(:sale, transaction_date: "2016/01/14", amount: 2940.87, client_id: client.id, region_product_id: region_product.id)
      prev_discounts = create(:discount, sale_id: prev_sales.id, transaction_date: "2016/09/14", amount: 189.53)
      prev_discounts2 = create(:discount, sale_id: prev_sales2.id, transaction_date: "2016/09/14", amount: 302.53)

      get "/api/v1/dashboard"

      expect(response).to be_success

      raw_data = JSON.parse(response.body)
      row = raw_data[0]

      expect(row).to have_key("clusters")
      expect(row).to have_key("products")
      expect(row).to have_key("regions")
      expect(row).to have_key("categories")
      expect(row).to have_key("net_sales_curr_year")
      expect(row).to have_key("segment_contribution")
      expect(row).to have_key("net_sales_growth")
      expect(row).to have_key("discount_percent")
      expect(row["clusters"]).to eq("ClientCluster1")
      expect(row["products"]).to eq("Product1")
      expect(row["regions"]).to eq("Region1")
      expect(row["categories"]).to eq("Category1")
      expect(row["net_sales_curr_year"].to_f).to eq(3871.77)
      expect(row["segment_contribution"].to_f).to eq(1.0)
      expect(row["net_sales_growth"].to_f).to eq(-0.1295)
      expect(row["discount_percent"].to_f).to eq(0.052)
    end
  end
end