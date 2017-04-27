class ModifyColumnToUsers < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :radius, :integer, default: 50
  end
end
