class AddRadiusToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :radius, :integer, default: 50, null: false
  end
end
