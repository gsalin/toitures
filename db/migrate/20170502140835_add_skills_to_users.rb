class AddSkillsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :construction, :boolean, null: false, default: false
    add_column :users, :renovation, :boolean, null: false, default: false
    add_column :users, :entretien, :boolean, null: false, default: false
    add_column :users, :maison, :boolean, null: false, default: false
    add_column :users, :chateau, :boolean, null: false, default: false
    add_column :users, :immeuble, :boolean, null: false, default: false
    add_column :users, :monument_historique, :boolean, null: false, default: false
    add_column :users, :charpente, :boolean, null: false, default: false
    add_column :users, :couverture, :boolean, null: false, default: false
    add_column :users, :ouverture, :boolean, null: false, default: false
    add_column :users, :terrasse, :boolean, null: false, default: false
    add_column :users, :plomberie, :boolean, null: false, default: false
  end
end
