class ChangeColumnstoUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :construction, :boolean, default: false
    change_column :users, :renovation, :boolean, default: false
    change_column :users, :entretien, :boolean, default: false
    change_column :users, :maison, :boolean, default: false
    change_column :users, :chateau, :boolean, default: false
    change_column :users, :immeuble, :boolean, default: false
    change_column :users, :monument_historique, :boolean, default: false
    change_column :users, :charpente, :boolean, default: false
    change_column :users, :couverture, :boolean, default: false
    change_column :users, :ouverture, :boolean, default: false
    change_column :users, :terrasse, :boolean, default: false
    change_column :users, :plomberie, :boolean, default: false
  end
end
