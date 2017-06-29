class AddLabelsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :qualibat, :boolean
    add_column :users, :rge, :boolean
    add_column :users, :mh, :boolean
  end
end
