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
end
