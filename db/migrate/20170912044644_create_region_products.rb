class CreateRegionProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :region_products do |t|
      t.references :region, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
