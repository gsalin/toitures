class AddMessageToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :message, :text
  end
end
