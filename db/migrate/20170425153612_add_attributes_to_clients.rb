class AddAttributesToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :nettoyage_toiture, :boolean
    add_column :clients, :renovation_charpente, :boolean
    add_column :clients, :renovation_toiture, :boolean
    add_column :clients, :construction_toiture, :boolean
  end
end
