class DashboardSerializer < ActiveModel::Serializer
  attributes :clusters, :products, :categories, :net_sales_curr_year, :segment_contribution, :net_sales_prev_year, :discounts_17

  def net_sales_prev_year
    object.sales_16 + object.discounts_16
  end

  def net_sales_curr_year
    object.sales_17 + object.discounts_17
  end

  def segment_contribution
    (net_sales_curr_year / Sale.get_global_net_sales).round(4)
  end
end