class ChangeDecimalFormatInDiscounts < ActiveRecord::Migration[5.1]
  def change
    change_column :discounts, :amount, :decimal, precision: 10, scale: 2
  end
end
