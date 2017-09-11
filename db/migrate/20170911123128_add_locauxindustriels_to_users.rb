class AddLocauxindustrielsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :locaux_industriels, :boolean
  end
end
