class AddMofToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :mof, :boolean
  end
end
