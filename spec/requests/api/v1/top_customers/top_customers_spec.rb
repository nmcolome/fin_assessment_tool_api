require 'rails_helper'

RSpec.describe 'TopCustomers API' do
  context 'GET api/v1/top_customers' do
    it 'returns top 10 global customers based on net sales' do
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

      get "/api/v1/top_customers"

      expect(response).to be_success

      raw_data = JSON.parse(response.body)
      row = raw_data[0]

      expect(row).to have_key("client")
      expect(row).to have_key("sales_16")
      expect(row).to have_key("discounts_16")
      expect(row).to have_key("net_sales_16")
      expect(row).to have_key("sales_17")
      expect(row).to have_key("discounts_17")
      expect(row).to have_key("net_sales_17")
      expect(row["client"]).to eq("Client4")
      expect(row["sales_16"].to_f).to eq(3955.74)
      expect(row["discounts_16"].to_f).to eq(492.06)
      expect(row["net_sales_16"].to_f).to eq(4447.8)
      expect(row["sales_17"].to_f).to eq(3670.43)
      expect(row["discounts_17"].to_f).to eq(201.34)
      expect(row["net_sales_17"].to_f).to eq(3871.77)
    end
  end
end