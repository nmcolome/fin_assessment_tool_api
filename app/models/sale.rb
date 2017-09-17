class Sale < ApplicationRecord
  belongs_to :client
  belongs_to :region_product
  has_many :discounts, dependent: :destroy
  has_many :cost_of_goods_solds, dependent: :destroy
  has_many :operating_expenses, dependent: :destroy

  def self.get_profit_and_loss
    Sale.find_by_sql [
      "SELECT DATE(sales.transaction_date), SUM(sales.amount) AS sales, SUM(discounts.amount) AS discount, SUM(cost_of_goods_solds.amount) AS cogs, SUM(operating_expenses.amount) AS op_expense
      FROM sales
      JOIN discounts ON discounts.sale_id = sales.id
      JOIN cost_of_goods_solds ON cost_of_goods_solds.sale_id = sales.id
      JOIN operating_expenses ON operating_expenses.sale_id = sales.id
      GROUP BY DATE(sales.transaction_date)
      ORDER BY DATE(sales.transaction_date);"
    ]
  end

  def self.get_dashboard
    month = get_latest_month
    result = Sale.find_by_sql [
      "WITH ytd_2017 AS (
        SELECT SUM(sales.amount) AS sales_17, SUM(discounts.amount) AS discounts_17, client_clusters.name AS clusters, products.name AS products, categories.name AS categories
        FROM sales
        JOIN clients
        ON sales.client_id = clients.id
        JOIN client_clusters
        ON clients.client_cluster_id = client_clusters.id
        JOIN region_products
        ON sales.region_product_id = region_products.id
        JOIN products
        ON region_products.product_id = products.id
        JOIN categories
        ON products.category_id = categories.id
        JOIN discounts
        ON discounts.sale_id = sales.id
        WHERE EXTRACT(year FROM sales.transaction_date) = 2017
        GROUP BY 3,5,4
      ), 
      ytd_2016 AS (
        SELECT SUM(sales.amount) AS sales_16, SUM(discounts.amount) AS discounts_16, client_clusters.name AS clusters, products.name AS products, categories.name AS categories
        FROM sales
        JOIN clients
        ON sales.client_id = clients.id
        JOIN client_clusters
        ON clients.client_cluster_id = client_clusters.id
        JOIN region_products
        ON sales.region_product_id = region_products.id
        JOIN products
        ON region_products.product_id = products.id
        JOIN categories
        ON products.category_id = categories.id
        JOIN discounts
        ON discounts.sale_id = sales.id
        WHERE EXTRACT(month FROM sales.transaction_date) BETWEEN 01 AND #{month} AND EXTRACT(year FROM sales.transaction_date) = 2016
        GROUP BY 3,5,4
      )
      SELECT sales_16, discounts_16, ytd_2017.*
      FROM ytd_2017
      JOIN ytd_2016 ON ytd_2017.clusters = ytd_2016.clusters AND ytd_2017.products = ytd_2016.products;"
    ]
  end

  def self.get_latest_month
    Sale.distinct.order(transaction_date: :desc).limit(1).pluck(:transaction_date)[0].month
  end

  def self.get_global_net_sales
    result = Sale.find_by_sql [
      "SELECT SUM(sales.amount) + SUM(discounts.amount) AS net_sales
      FROM sales
      JOIN discounts ON discounts.sale_id = sales.id
      WHERE EXTRACT(year FROM sales.transaction_date) = 2017;"
    ]
    result[0].net_sales
  end
end
