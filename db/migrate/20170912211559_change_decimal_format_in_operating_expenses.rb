class ChangeDecimalFormatInOperatingExpenses < ActiveRecord::Migration[5.1]
  def change
    change_column :operating_expenses, :amount, :decimal, precision: 10, scale: 2
  end
end
