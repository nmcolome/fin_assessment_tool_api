class ChangeDecimalFormatInSales < ActiveRecord::Migration[5.1]
  def change
    rename_column :sales, :sales, :amount
    change_column :sales, :amount, :decimal, precision: 10, scale: 2
  end
end
