class AddSkillsToClient < ActiveRecord::Migration[5.0]
  def change
    add_column  :clients, :construction,        :boolean, default: false, null: false
    add_column  :clients, :renovation,          :boolean, default: false, null: false
    add_column  :clients, :entretien,           :boolean, default: false, null: false
    add_column  :clients, :maison,              :boolean, default: false, null: false
    add_column  :clients, :chateau,             :boolean, default: false, null: false
    add_column  :clients, :immeuble,            :boolean, default: false, null: false
    add_column  :clients, :monument_historique, :boolean, default: false, null: false
    add_column  :clients, :charpente,           :boolean, default: false, null: false
    add_column  :clients, :couverture,          :boolean, default: false, null: false
    add_column  :clients, :ouverture,           :boolean, default: false, null: false
    add_column  :clients, :terrasse,            :boolean, default: false, null: false
    add_column  :clients, :plomberie,           :boolean, default: false, null: false
  end
end
