class AddNewAttributesToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :architecte, :boolean
    add_column :clients, :isolation, :boolean
  end
end
