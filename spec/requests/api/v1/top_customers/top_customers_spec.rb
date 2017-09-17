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
    end
  end
end