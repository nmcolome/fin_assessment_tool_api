class AddTransactionDateToSales < ActiveRecord::Migration[5.1]
  def change
    add_column :sales, :transaction_date, :date, null: false
  end
end
