class AddLocauxindustrielsToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :locaux_industriels, :boolean
  end
end
