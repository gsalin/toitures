class AddLinkPressToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :website, :string
    add_column :users, :twitter, :string
    add_column :users, :linkedin, :string
    add_column :users, :press_link_1, :string
    add_column :users, :press_link_title_1, :string
    add_column :users, :press_link_2, :string
    add_column :users, :press_link_title_2, :string
    add_column :users, :press_link_3, :string
    add_column :users, :press_link_title_3, :string
  end
end
