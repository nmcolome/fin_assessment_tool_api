class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.references :client, foreign_key: true
      t.references :region_product, foreign_key: true
      t.decimal :sales, precision: 2

      t.timestamps
    end
  end
end
