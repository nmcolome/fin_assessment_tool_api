require 'rails_helper'

RSpec.describe 'Dashboard API' do
  context 'GET /api/v1/dashboard' do
    it 'returns YTD net_sales and discounts for current and previous year' do
      sales = create(:sale)
      discounts = create(:discount, sale_id: sales.id)

      get "/api/v1/dashboard"

      expect(response).to be_success

      raw_data = JSON.parse(response.body)
      binding.pry
      # first_month_data = raw_data[0]
    end
  end
end