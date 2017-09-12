class CreateClientClusters < ActiveRecord::Migration[5.1]
  def change
    create_table :client_clusters do |t|
      t.string :name

      t.timestamps
    end
  end
end
