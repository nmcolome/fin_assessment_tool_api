class CreateDiscounts < ActiveRecord::Migration[5.1]
  def change
    create_table :discounts do |t|
      t.references :sale, foreign_key: true
      t.string :account
      t.string :description
      t.decimal :amount, precision: 2

      t.timestamps
    end
  end
end
