class AddBatimentAgricoleToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :batiment_agricole, :boolean
  end
end
