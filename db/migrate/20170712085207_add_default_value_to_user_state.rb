class AddDefaultValueToUserState < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :state, :integer, default: 0
  end
end
