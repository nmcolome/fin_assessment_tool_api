class ProfitAndLossSerializer < ActiveModel::Serializer
  attributes :date, :sales, :discount, :cogs, :op_expense, :gross_profit

  def gross_profit
    self.sales - self.discount
  end
end