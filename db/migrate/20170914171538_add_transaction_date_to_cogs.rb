class AddTransactionDateToCogs < ActiveRecord::Migration[5.1]
  def change
    add_column :cost_of_goods_solds, :transaction_date, :date, null: false
  end
end
