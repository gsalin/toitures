class AddNewAttributesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :architecte, :boolean
    add_column :users, :isolation, :boolean
    add_column :users, :epv, :boolean
    add_column :users, :specialite1, :string
    add_column :users, :specialite2, :string
    add_column :users, :specialite3, :string
  end
end
