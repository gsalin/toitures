class AddBatimentAgricoleToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :batiment_agricole, :boolean
  end
end
