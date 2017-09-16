class DashboardSerializer < ActiveModel::Serializer
  attributes :clusters, :products, :regions, :categories, :net_sales_curr_year, :segment_contribution, :net_sales_growth, :discount_percent

  def net_sales_prev_year
    object.sales_16 + object.discounts_16
  end

  def net_sales_curr_year
    object.sales_17 + object.discounts_17
  end

  def net_sales_growth
    ((self.net_sales_curr_year - self.net_sales_prev_year) / self.net_sales_prev_year).round(4)
  end

  def discount_percent
    (object.discounts_17 / self.net_sales_curr_year).round(4)
  end

  def segment_contribution
    (net_sales_curr_year / Sale.get_global_net_sales).round(4)
  end
end