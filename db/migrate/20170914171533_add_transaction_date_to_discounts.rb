class AddTransactionDateToDiscounts < ActiveRecord::Migration[5.1]
  def change
    add_column :discounts, :transaction_date, :date, null: false
  end
end
