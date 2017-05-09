class ChangeColumnstoClients < ActiveRecord::Migration[5.0]
  def change
    change_column :clients, :nettoyage_toiture, :boolean, default: false
    change_column :clients, :renovation_charpente, :boolean, default: false
    change_column :clients, :renovation_toiture, :boolean, default: false
    change_column :clients, :construction_toiture, :boolean, default: false
  end
end
