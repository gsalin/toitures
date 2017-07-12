class AddStateToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :state, :integer
    add_index :users, :state
  end
end
