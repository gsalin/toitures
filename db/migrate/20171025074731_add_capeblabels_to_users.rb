class AddCapeblabelsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :capeb, :boolean
    add_column :users, :rge_eco_artisan, :boolean
  end
end
