class AddColumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :looking_for_job, :boolean
    add_column :users, :charpentier, :boolean
    add_column :users, :couvreur, :boolean
  end
end
