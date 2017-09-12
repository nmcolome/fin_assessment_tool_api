class ChangeDecimalFormatInCostOfGoodsSolds < ActiveRecord::Migration[5.1]
  def change
    change_column :cost_of_goods_solds, :amount, :decimal, precision: 10, scale: 2
  end
end
