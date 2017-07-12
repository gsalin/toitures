class AddDefaultValueToUserState2 < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :state, :integer, default: 1
  end
end
