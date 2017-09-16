class ProfitAndLossSerializer < ActiveModel::Serializer
  attributes :date, :sales, :discount, :net_sales, :cogs, :gross_profit, :op_expense, :net_profit

  def net_sales
    object.sales + object.discount
  end

  def gross_profit
    self.net_sales + object.cogs
  end

  def net_profit
    self.gross_profit + object.op_expense
  end
end