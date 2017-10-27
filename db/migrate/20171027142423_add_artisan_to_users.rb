class AddArtisanToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :artisan, :boolean
    add_column :users, :artisan_d_art, :boolean
    add_column :users, :maitre_artisan, :boolean
  end
end
