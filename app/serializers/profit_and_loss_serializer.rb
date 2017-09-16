class ProfitAndLossSerializer < ActiveModel::Serializer
  attributes :date, :sales, :discount, :net_sales, :cogs, :gross_profit, :op_expense, :net_profit

  def net_sales
    object.sales + object.discount
  end

  def gross_profit
    object.sales + object.discount + object.cogs
  end

  def net_profit
    object.sales + object.discount + object.cogs + object.op_expense
  end
end