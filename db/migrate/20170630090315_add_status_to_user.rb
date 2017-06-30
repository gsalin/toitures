class AddStatusToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :status, :integer
    add_index :users, :status
  end
end
