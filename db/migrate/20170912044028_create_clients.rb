class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.references :client_cluster, foreign_key: true
      t.references :region, foreign_key: true

      t.timestamps
    end
  end
end
