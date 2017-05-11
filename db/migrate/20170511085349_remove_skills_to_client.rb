class RemoveSkillsToClient < ActiveRecord::Migration[5.0]
  def change
    remove_column :clients, :nettoyage_toiture
    remove_column :clients, :renovation_charpente
    remove_column :clients, :renovation_toiture
    remove_column :clients, :construction_toiture
  end
end
