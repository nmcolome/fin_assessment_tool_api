class AddTransactionDateToOperatingExpenses < ActiveRecord::Migration[5.1]
  def change
    add_column :operating_expenses, :transaction_date, :date, null: false
  end
end
