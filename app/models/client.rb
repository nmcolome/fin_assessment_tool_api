class Client < ApplicationRecord
  belongs_to :client_cluster
  belongs_to :region
  has_many :sales, dependent: :destroy

  def self.get_top_customers
    month = Sale.get_latest_month
    Client.find_by_sql [
      "WITH top_cust AS (
      SELECT SUM(sales.amount) AS sales_17, SUM(discounts.amount) AS discounts_17, SUM(sales.amount) + SUM(discounts.amount) AS net_sales_17, clients.name AS client, clients.id AS client_id
      FROM clients
      JOIN sales
      ON sales.client_id = clients.id
      JOIN discounts
      ON discounts.sale_id = sales.id
      WHERE EXTRACT(year FROM sales.transaction_date) = 2017
      GROUP BY 4,5
      ORDER BY 3 DESC
      LIMIT 10
      ), 
      ytd_2016 AS (
      SELECT SUM(sales.amount) AS sales_16, SUM(discounts.amount) AS discounts_16, SUM(sales.amount) + SUM(discounts.amount) AS net_sales_16, clients.name AS client, clients.id AS id
      FROM clients
      JOIN sales
      ON sales.client_id = clients.id
      JOIN discounts
      ON discounts.sale_id = sales.id
      WHERE EXTRACT(month FROM sales.transaction_date) BETWEEN 01 AND #{month} AND EXTRACT(year FROM sales.transaction_date) = 2016
      GROUP BY 4,5
      )
      SELECT sales_16, discounts_16, net_sales_16, top_cust.*
      FROM top_cust
      JOIN ytd_2016 ON top_cust.client_id = ytd_2016.id;"
    ]
  end
end
